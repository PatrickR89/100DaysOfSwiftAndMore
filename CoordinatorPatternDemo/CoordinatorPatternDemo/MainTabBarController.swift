//
//  MainTabBarController.swift
//  CoordinatorPatternDemo
//
//  Created by Patrick on 04.11.2022..
//

import UIKit

class MainTabBarController: UITabBarController {

    let main = MainCoordinator(navigationController: UINavigationController())

    override func viewDidLoad() {
        super.viewDidLoad()

//        main.start()
//        viewControllers = [main.navigationController]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
