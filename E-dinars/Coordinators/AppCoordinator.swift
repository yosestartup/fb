//
//  AppCoordinator.swift
//  E-dinars
//
//  Created by Oleksandr Bambulyak on 11.07.2018.
//  Copyright © 2018 Oleksandr Bambulyak. All rights reserved.

import Foundation
import UIKit

final class AppCoordinator: Coordinator {
    func start() {
        let logged = true
        
        if logged {
            startBaseTabBarCoordinator()
        } else {
            startAuthCoordinator()
        }
    }
}

// MARK: - Start methods
private extension AppCoordinator {
    func startBaseTabBarCoordinator() {
        let coordinator = BaseTabBarCoordinator(navigationController: navigationController)
        coordinator.start()
    }
    
    func startAuthCoordinator() {
        let coordinator = AuthCoordinator(navigationController: navigationController)
        coordinator.start()
    }
}
