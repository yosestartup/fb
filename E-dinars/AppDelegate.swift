//
//  AppDelegate.swift
//  E-dinars
//
//  Created by Oleksandr Bambulyak on 03.07.2018.
//  Copyright © 2018 Oleksandr Bambulyak. All rights reserved.
//

import UIKit
import FBSDKCoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions
        launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        UIApplication.shared.statusBarStyle = .lightContent
        window = UIWindow()
        
        let navigationController = UINavigationController()
        window?.rootViewController = navigationController
        let coordinator = AppCoordinator(navigationController: navigationController)
        coordinator.start()
        window?.makeKeyAndVisible()
        
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        let handled = FBSDKApplicationDelegate.sharedInstance().application(app,
                                                                            open: url,
                                                                            sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as?  String,
                                                                            annotation: [UIApplicationOpenURLOptionsKey.annotation])
        return handled
    }
    
}
