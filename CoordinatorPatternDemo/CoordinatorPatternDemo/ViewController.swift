//
//  ViewController.swift
//  CoordinatorPatternDemo
//
//  Created by Patrick on 04.11.2022..
//

import UIKit

class ViewController: UIViewController, Storyboarded {
    @IBOutlet var product: UISegmentedControl!
    weak var coordinator: MainCoordinator?
    
    var buyAction: ((Int) -> Void)?
    var createAccAction: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .green
    }
    @IBAction func buyTapped(_ sender: Any) {
//        coordinator?.buySubscription(to: product.selectedSegmentIndex)
        buyAction?(product.selectedSegmentIndex)
    }
    @IBAction func createAccTapped(_ sender: Any) {
//        coordinator?.createAccount()
        createAccAction?()
    }
    

}

