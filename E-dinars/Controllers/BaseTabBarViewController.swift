//
//  DashboardViewController.swift
//  E-dinars
//
//  Created by Oleksandr Bambulyak on 12.07.2018.
//  Copyright © 2018 Oleksandr Bambulyak. All rights reserved.
//

import UIKit

final class BaseTabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    /// Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Logic
    func setupControllers(viewControllers: [UIViewController]) {
        for (index, viewController) in viewControllers.enumerated() {
            switch index {
            case 0:
                viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: index)
            case 1:
                viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: index)
            default:
                print("e")
            }
        }
        self.viewControllers = viewControllers
    }
}
