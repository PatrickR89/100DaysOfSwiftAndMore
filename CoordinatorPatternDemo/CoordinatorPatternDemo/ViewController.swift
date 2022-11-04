//
//  ViewController.swift
//  CoordinatorPatternDemo
//
//  Created by Patrick on 04.11.2022..
//

import UIKit

class ViewController: UIViewController, Storyboarded {

    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .green
    }
    @IBAction func buyTapped(_ sender: Any) {
        coordinator?.buySubscription()
    }
    @IBAction func createAccTapped(_ sender: Any) {
        coordinator?.createAccount()
    }
    

}

