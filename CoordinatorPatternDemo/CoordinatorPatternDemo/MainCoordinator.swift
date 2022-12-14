//
//  MainCoordinator.swift
//  CoordinatorPatternDemo
//
//  Created by Patrick on 04.11.2022..
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
//        navigationController.delegate = self
        let vc = ViewController.instantiate()
//        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
//        vc.coordinator = self
        vc.buyAction = { [weak self] value in
            self?.buySubscription(to: value)
        }

        vc.createAccAction = { [weak self] in
            self?.createAccount()
        }
        navigationController.pushViewController(vc, animated: false)
    }

//    func buySubscription() {
//        let child = BuyCoordinator(navigationController: navigationController)
//        child.parentCoordinator = self
//        childCoordinators.append(child)
//        child.start()
//    }

    func buySubscription(to productType: Int) {
        let vc = BuyViewController.instantiate()
        vc.selectedProduct = productType
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }

    func createAccount() {
        let vc = CreateAccountViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }

    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }

//    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
//        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {return}
//        if navigationController.viewControllers.contains(fromViewController) {return}
//        if let buyViewController = fromViewController as? BuyViewController {
//            childDidFinish(buyViewController.coordinator)
//        }
//    }
}
