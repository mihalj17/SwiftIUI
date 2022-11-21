//
//  Coordinators.swift
//  Coordinators
//
//  Created by Matko Mihaljl on 13.10.2022..
//

import Foundation
import UIKit

protocol Coordinator {
    
    var childCoordinators: [Coordinator] {get set}
    var navigationController: UINavigationController {get set}
    
    func start()
}
