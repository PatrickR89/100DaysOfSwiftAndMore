//
//  BankView.swift
//  projectMVVMBank
//
//  Created by Patrick on 16.08.2022..
//

import UIKit

class BankView: UIView {

    var bankViewModel = BankViewModel(with: Bank(paymentMethod: "", balance: 0.0)) {
        didSet {
            updateUI()
        }
    }

    let bankLabel: UILabel

    init(with viewModel: BankViewModel) {
        self.bankLabel = UILabel()

        super.init(frame: .zero)
        // set defer init, otherwise didSet is not called!!!
        defer { self.bankViewModel = viewModel }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateUI() {
        self.setupUI()
        bankLabel.text = bankViewModel.bankBalance()
    }

    func setupUI() {
        self.addSubview(bankLabel)
        bankLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            bankLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            bankLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            bankLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8)
        ])
    }
}
