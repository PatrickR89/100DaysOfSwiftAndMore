//
//  ViewController.swift
//  projectMVVMBank
//
//  Created by Patrick on 16.08.2022..
//

import UIKit

class ViewController: UIViewController {

    var bankViewModel: BankViewModel = BankViewModel(with: Bank(paymentMethod: "", balance: 10))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .lightGray
        bankViewModel = BankViewModel(with: Bank(paymentMethod: "", balance: 70))

        let bankView = BankView(with: bankViewModel)

        setupBankView(bankView: bankView)

    }

    func setupBankView(bankView: BankView) {
        view.addSubview(bankView)
        bankView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            bankView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            bankView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            bankView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bankView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        ])
    }
}

