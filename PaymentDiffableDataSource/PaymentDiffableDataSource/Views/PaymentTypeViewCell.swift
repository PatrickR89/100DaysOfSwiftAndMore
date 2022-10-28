//
//  PaymentTypeViewCell.swift
//  PaymentDiffableDataSource
//
//  Created by Patrick on 28.10.2022..
//

import UIKit

class PaymentTypeViewCell: UITableViewCell {

    var paymentLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {
        contentView.addSubview(paymentLabel)
        paymentLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            paymentLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            paymentLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            paymentLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor)
        ])
    }

    func updateLabel(model: PaymentTypeCellModel) {
        paymentLabel.text = model.name
    }
}
