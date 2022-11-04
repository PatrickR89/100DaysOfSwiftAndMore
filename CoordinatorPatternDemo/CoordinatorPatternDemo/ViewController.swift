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
        view.backgroundColor = .blue
    }
    @IBAction func buyTapped(_ sender: Any) {
    }
    @IBAction func createAccTapped(_ sender: Any) {
    }
    

}

