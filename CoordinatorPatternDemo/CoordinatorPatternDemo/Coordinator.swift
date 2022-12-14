//
//  Coordinator.swift
//  CoordinatorPatternDemo
//
//  Created by Patrick on 04.11.2022..
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] {get set}
    var navigationController: UINavigationController {get set}

    func start()
}
