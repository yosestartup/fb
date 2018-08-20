//
//  AccountCoordinator.swift
//  E-dinars
//
//  Created by Oleksandr Bambulyak on 12.07.2018.
//  Copyright © 2018 Oleksandr Bambulyak. All rights reserved.
//

import UIKit

final class MyAccountsCoordinator: Coordinator {
    /// Coordinators
    lazy var myAccountsViewController: MyAccountsViewController = {
        let myAccountsViewController = MyAccountsViewController()
        return myAccountsViewController
    }()
    
    /// Start mehods
    func start() {
        
    }
}
