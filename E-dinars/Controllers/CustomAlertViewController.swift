//
//  CustomAlertViewController.swift
//  E-dinars
//
//  Created by Oleksandr Bambulyak on 06.07.2018.
//  Copyright © 2018 Oleksandr Bambulyak. All rights reserved.
//

import UIKit

class CustomAlertViewController: UIViewController {
    
    //*****************************************************************************/
    // MARK: - Variables, Constants and outlets
    //*****************************************************************************/
    private var alertContentView: CustomAlertContentView?
    private var maskLayer = CAShapeLayer()
    private var maskView = UIView()
    
    //*****************************************************************************/
    // MARK: - Initialization
    //*****************************************************************************/
    convenience init(title: String?, message: String?, image: UIImage?) {
        self.init()
        
        self.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        self.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        
        alertContentView = CustomAlertContentView(title: title, description: message, image: image)
    }
    
    //*****************************************************************************/
    // MARK: - ViewController LifeCycle
    //*****************************************************************************/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let alertContentViews = alertContentView else {
            print("[AGAlertController] Error: Alert Content View is nil")
            return
        }
       
        alertContentViews.translatesAutoresizingMaskIntoConstraints = false
        
        // Add Alert and It's Mask
        self.view.addSubview(maskView)
        //self.view.insertSubview(maskView, belowSubview: alertContentView!)
        self.view.addSubview(alertContentViews)
        
        NSLayoutConstraint.activate([
            alertContentViews.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            alertContentViews.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            alertContentViews.widthAnchor.constraint(equalToConstant: 270)])
        
        view.layoutIfNeeded()
        
        // Positioning
        self.maskView.backgroundColor = UIColor.black.withAlphaComponent(0)
        self.maskView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([maskView.topAnchor.constraint(equalTo: view.topAnchor),
                                     maskView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                     maskView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     maskView.trailingAnchor.constraint(equalTo: view.trailingAnchor)])

        view.layoutIfNeeded()

        //     Creating mask
        
        alertContentViews.roundView.convert(view.frame, to: view)
        alertContentViews.convert(view.frame, to: view)
      
        let maskInvertedPath = UIBezierPath(rect: self.view.bounds)
     //   maskInvertedPath.append(maskPath)

        self.maskLayer.frame = alertContentViews.bounds
        self.maskLayer.fillRule = kCAFillRuleEvenOdd
        self.maskLayer.path = maskInvertedPath.cgPath

        // Minor view preparation
        self.maskView.layer.mask = maskLayer
        self.maskView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        self.alertContentView?.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        self.alertContentView?.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Custom animation
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
            self.maskView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
            self.alertContentView?.alpha = 1
            self.alertContentView?.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.maskView.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // For the purpose of making actions without captured weak ref
        self.alertContentView?.removeFromSuperview()
        self.alertContentView = nil
    }
    
    //*****************************************************************************/
    // MARK: - AlertActions
    //*****************************************************************************/
    internal func addAction(_ action: AlertAction) {
        action.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
        self.alertContentView?.add(action)
    }
    
    internal func addActions(_ actions: [AlertAction]) {
        for action in actions {
            self.addAction(action)
        }
    }
    
    internal func addContent(_ content: UIView) {
        alertContentView?.viewsStack.addArrangedSubview(content)
    }
    
    internal func addContent(_ content: UIView, size: CGSize) {
        alertContentView?.viewsStack.addArrangedSubview(content)
        content.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([content.widthAnchor.constraint(equalToConstant: size.width),
                                     content.heightAnchor.constraint(equalToConstant: size.height)
            ])
    }
    
    //*****************************************************************************/
    // MARK: - Presenting / Dismissing
    //*****************************************************************************/
    internal func present(from tempVc: UIViewController) {
        tempVc.present(self, animated: false, completion: nil)
    }
    
    @objc internal func dismissAlert() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
            self.maskView.backgroundColor = UIColor.black.withAlphaComponent(0)
            self.alertContentView?.alpha = 0
        }) { (_) in
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    //*****************************************************************************/
    // MARK: - Memory Management
    //*****************************************************************************/
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    deinit {
        print("[AGAlertController] deinit")
    }
}
