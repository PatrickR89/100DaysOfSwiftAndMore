//
//  CountryCell.swift
//  challenge-d59
//
//  Created by Patrick on 20.07.2022..
//

import UIKit

class CountryCell: UITableViewCell {

    var name = "Bangladesh"
    lazy var flagView = UIImageView()
    lazy var nameLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configImageView()
        configNameLabel()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configImageView() {
        contentView.addSubview(flagView)
        flagView.backgroundColor = .black
        flagView.layer.borderColor = UIColor.lightGray.cgColor
        flagView.layer.borderWidth = 0.25

        flagView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            flagView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            flagView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            flagView.heightAnchor.constraint(equalToConstant: 40),
            flagView.widthAnchor.constraint(equalTo: flagView.heightAnchor, multiplier: 1.5)
        ])
    }

    func configNameLabel() {
        contentView.addSubview(nameLabel)
        nameLabel.text = name

        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: flagView.trailingAnchor, constant: 20)
        ])
    }

    func setupCell(name: String, image: String) {
        nameLabel.text = name
        flagView.image = UIImage(named: image)
    }
}
