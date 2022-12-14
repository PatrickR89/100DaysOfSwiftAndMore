//
//  SceneDelegate.swift
//  challenge-d74
//
//  Created by Patrick on 11.08.2022..
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene: UIWindowScene = (scene as? UIWindowScene) else {return}
        let navController = UINavigationController()
        let viewController = NotesListViewController()

        navController.viewControllers = [viewController]

        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}
