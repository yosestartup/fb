//
//  MyAccountsViewController.swift
//  E-dinars
//
//  Created by Oleksandr Bambulyak on 12.07.2018.
//  Copyright © 2018 Oleksandr Bambulyak. All rights reserved.
//swiftlint:disable force_cast

//swiftlint:disable force_unwrapping
//swiftlint:disable implicitly_unwrapped_optional

import RxSwift
import RxCocoa

import UIKit
import FBSDKLoginKit
import Realm
import RealmSwift
import MBProgressHUD

class MyAccountsViewController: UIViewController, FBSDKLoginButtonDelegate, UITableViewDelegate, UITableViewDataSource {
   
    var refreshControl = UIRefreshControl()
    
    //UI
    private var tableView: UITableView!
    private let button = FBSDKLoginButton()
    
    
    //View models
    private let disposeBag = DisposeBag()
    private let myAccountsViewModel: MyAccountsViewModelProtocol = MyAccountsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setupViewModels()
        myAccountsViewModel.initialLoadFromRealm()
   
        if let token = FBSDKAccessToken.current() {
            myAccountsViewModel.fetchUser()
        }
    }
    
    @objc func fetchPostsWithPull(refreshControl: UIRefreshControl) {
        if (FBSDKAccessToken.current() != nil) {
            print(FBSDKAccessToken.current().tokenString)
            myAccountsViewModel.fetchUser()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myAccountsViewModel.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "MyEbayAccountTableViewCell") as! MyEbayAccountTableViewCell
        let post = myAccountsViewModel.data[indexPath.row]
    
        cell.fill(name: post.message, author: (post.from?.name)!,
                  description: post.descriptionString, imageUrl: post.imageUrl,
                  isEditable: false)
    
        return cell
    }
  
    func configureUI() {
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        button.delegate = self
        
        tableView = UITableView()
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: button.bottomAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(fetchPostsWithPull(refreshControl:)), for: UIControlEvents.valueChanged)
        tableView.addSubview(refreshControl) // not required when using UITableViewController
        
        
        let nib = UINib(nibName: "MyEbayAccountTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "MyEbayAccountTableViewCell")
        
        navigationController?.navigationBar.isHidden = true
    }
 
}

private extension MyAccountsViewController {
    
    internal func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print(error)
            return
        }
        print ("Success")
        myAccountsViewModel.fetchUser()
    }
    
    internal func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Outed Succes")
    }
}

// MARK: - ViewModels
private extension MyAccountsViewController {
    func setupViewModels() {
        bindUI()
        bindViewModel()
}
    
    func bindUI() {
    
    }
    
    func bindViewModel() {
        
        //isSpinnerActiveObservable
        myAccountsViewModel.isSpinnerActiveObservable
            .subscribe(onNext: { [unowned self] (value) in
                guard value else {
                    return
                }
            
                if value {
                    let loadingNotification = MBProgressHUD.showAdded(to: self.view, animated: true)
                    loadingNotification.mode = MBProgressHUDMode.indeterminate
                    loadingNotification.label.text = "Loading"
                } else {
                    MBProgressHUD.hide(for: self.view, animated: true)
                }
            }).disposed(by: disposeBag)
        
        //isElementsSameObservable
        myAccountsViewModel.isElementsSameObservable
            .filter { $0 == true }
            .subscribe(onNext: { [unowned self] (value) in
                guard value else {
                    return
                }
                
                
                self.tableView.reloadData()
                if self.refreshControl.isRefreshing {
                self.refreshControl.endRefreshing()
           }
                MBProgressHUD.hide(for: self.view, animated: true)
            }).disposed(by: disposeBag)
        
        
        //isElementsNotSameObservable
        myAccountsViewModel.isElementsNotSameObservable
            .filter { $0 == true }
            .subscribe(onNext: { [unowned self] (value) in
                guard value else {
                    return
                }

                
                self.tableView.reloadData()
                if self.refreshControl.isRefreshing {
                self.refreshControl.endRefreshing()
            }
                MBProgressHUD.hide(for: self.view, animated: true)
            }).disposed(by: disposeBag)
        
        //isRealmDataDownloaded
        myAccountsViewModel.isRealmDataDownloadedObservable
            .filter { $0 == true }
            .subscribe(onNext: { [unowned self] (value) in
                guard value else {
                    return
                }
                
                self.tableView.reloadData()
            }).disposed(by: disposeBag)
        }
}
