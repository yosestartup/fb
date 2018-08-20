//
//  OrdersCoordinator.swift
//  E-dinars
//
//  Created by Oleksandr Bambulyak on 12.07.2018.
//  Copyright © 2018 Oleksandr Bambulyak. All rights reserved.
//

import UIKit

class OrdersCoordinator: Coordinator {

    lazy var ordersViewController: OrdersViewController = {
        let ordersViewController = OrdersViewController()
        return ordersViewController
    }()
    
    func start() {
        
    }
}
