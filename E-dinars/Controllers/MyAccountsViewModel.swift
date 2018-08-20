//
//  MyAccountsViewModel.swift
//  E-dinars
//
//  Created by Oleksandr Bambulyak on 15.08.2018.
//  Copyright © 2018 Oleksandr Bambulyak. All rights reserved.
//

import UIKit
import RxCocoa
import RealmSwift
import RxSwift
import Realm

protocol MyAccountsViewModelProtocol {
    
    ///Model
    var data: [Post] { get set }
    
    
    /// To View
    var isSpinnerActiveObservable: Observable<Bool> { get }
    var isElementsSameObservable: Observable<Bool> { get }
    var isElementsNotSameObservable: Observable<Bool> { get }
    var isRealmDataDownloadedObservable: Observable<Bool> { get }

    /// From View
    
    
    /// Actions
    func fetchUser()
    func initialLoadFromRealm()
}

final class MyAccountsViewModel: MyAccountsViewModelProtocol {
    
    //Model
    var data: [Post] = []
    
    /// Variables
    var isSpinnerActive = BehaviorRelay<Bool>(value: false)
    var isElementsSame = BehaviorRelay<Bool>(value: false)
    var isElementsNotSame = BehaviorRelay<Bool>(value: false)
    var isRealmDataDownloaded = BehaviorRelay<Bool>(value: false)
    
    /// Observables
    lazy var isSpinnerActiveObservable = isSpinnerActive.asObservable()
    lazy var isElementsSameObservable = isElementsSame.asObservable()
    lazy var isElementsNotSameObservable = isElementsNotSame.asObservable()
    lazy var isRealmDataDownloadedObservable = isRealmDataDownloaded.asObservable()
    
    /// Api service
    let facebookPostService = FacebookPostService()
    let realmServices = RealmServices()
    
    func initialLoadFromRealm() {
        setDataFromRealm()
    }
}

///Fetching
extension MyAccountsViewModel: FacebookPostServiceDelegate {
    
    func didFinishDownloading(posts: [Post]) {
        self.data = posts
        
        if !realmServices.isElementsSame(posts: posts) {
            realmServices.updateDatabase(type: Post.self, posts: posts)
            isElementsSame.accept(true)
        } else {
            setDataFromRealm()
            isElementsNotSame.accept(true)
        }
    }
    
    func fetchUser() {
        facebookPostService.delegate = self
        isSpinnerActive.accept(true)
        facebookPostService.loadData()
    }
}

//Realm
extension MyAccountsViewModel: RealmServicesDelegate {
    
    func didFinishLoadingFromDatabase(posts: [Post]) {
        self.data = posts
        isRealmDataDownloaded.accept(true)
    }
    
    func setDataFromRealm() {
        realmServices.delegate = self
        realmServices.loadData()
    }
}

