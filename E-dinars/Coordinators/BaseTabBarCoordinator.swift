//
//  BaseCoordinator.swift
//  E-dinars
//
//  Created by Oleksandr Bambulyak on 11.07.2018.
//  Copyright © 2018 Oleksandr Bambulyak. All rights reserved.
//

import UIKit

final class BaseTabBarCoordinator: Coordinator {
    /// Coordinators
    lazy var myAccountsCoordinator: MyAccountsCoordinator = {
        let myAccountsCoordinator = MyAccountsCoordinator(navigationController: navigationController)
        return myAccountsCoordinator
    }()
    
    lazy var ordersCoordinator: OrdersCoordinator = {
        let ordersCoordinator = OrdersCoordinator(navigationController: navigationController)
        return ordersCoordinator
    }()
    
    /// Start methods
    func start() {
        let baseTabBarViewController = BaseTabBarViewController()
        baseTabBarViewController.setupControllers(viewControllers:
            [myAccountsCoordinator.myAccountsViewController,
            ordersCoordinator.ordersViewController])
        
        navigationController?.setViewControllers([baseTabBarViewController], animated: true)
    }
}
