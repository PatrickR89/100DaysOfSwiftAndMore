//
//  PaymentDetailsViewCell.swift
//  PaymentDiffableDataSource
//
//  Created by Patrick on 28.10.2022..
//

import UIKit

class PaymentDetailsViewCell: UITableViewCell {

    var currencyLabel = UILabel()
    var priceLabel = UILabel()
    var titleLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateData(model: PaymentDetailsModel) {
        currencyLabel.text = model.currency
        priceLabel.text = model.price
        titleLabel.text = model.title
    }

    func setupUI() {
        contentView.addSubview(currencyLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(titleLabel)

        currencyLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            currencyLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            currencyLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            priceLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: currencyLabel.leadingAnchor, constant: -10),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)
        ])
    }
}
