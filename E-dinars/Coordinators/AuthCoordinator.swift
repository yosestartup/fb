//
//  AuthCoordinator.swift
//  E-dinars
//
//  Created by Oleksandr Bambulyak on 11.07.2018.
//  Copyright © 2018 Oleksandr Bambulyak. All rights reserved.
//

import UIKit

final class AuthCoordinator: Coordinator {
    /// Start methods
    func start() {
        let viewController = LoginViewController()
        viewController.coordinatorDelegate = self
        navigationController?.setViewControllers([viewController], animated: true)
    }
}

// MARK: - LoginCoordinatorDelegate
extension AuthCoordinator: LoginCoordinatorDelegate {
    func forgotPasswordAction(inViewController viewController: LoginViewController) {
        let forgotVC = UIViewController()
        navigationController?.pushViewController(forgotVC, animated: true)
    }
}
