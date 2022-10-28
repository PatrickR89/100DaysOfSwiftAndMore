//
//  ViewController.swift
//  project18
//
//  Created by Patrick on 10.08.2022..
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(1, 2, 3, 4, 5, separator: "-")
        print("message", terminator: "")

        assert(1 == 1, "Math failure")
//        assert(1 == 2, "Math failure!!!")

        for i in 1...100 {
            print("got num \(i)")
        }

    }
}
