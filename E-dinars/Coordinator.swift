//
//  Coordinator.swift
//  E-dinars
//
//  Created by Oleksandr Bambulyak on 11.07.2018.
//  Copyright © 2018 Oleksandr Bambulyak. All rights reserved.
//

import UIKit
import Foundation

class Coordinator {
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
}
