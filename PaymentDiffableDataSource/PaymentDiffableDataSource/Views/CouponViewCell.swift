//
//  CouponViewCell.swift
//  PaymentDiffableDataSource
//
//  Created by Patrick on 28.10.2022..
//

import UIKit

class CouponViewCell: UITableViewCell {

    var offer1Button = UIButton()
    var offer2Button = UIButton()
    var offer3Button = UIButton()
    var offer4Button = UIButton()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setupUI() {
        let buttons: [UIButton] = [offer1Button, offer2Button, offer3Button, offer4Button]
        offer1Button.addTarget(self, action: #selector(tapOnOffer1), for: .touchUpInside)
        offer2Button.addTarget(self, action: #selector(tapOnOffer2), for: .touchUpInside)
        offer3Button.addTarget(self, action: #selector(tapOnOffer3), for: .touchUpInside)
        offer4Button.addTarget(self, action: #selector(tapOnOffer4), for: .touchUpInside)

        buttons.forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.backgroundColor = .lightGray
            $0.setTitleColor(.systemBlue, for: .normal)

            NSLayoutConstraint.activate([
                $0.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                $0.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9),
                $0.heightAnchor.constraint(equalToConstant: 30)
            ])
        }

        for (index, button) in buttons.enumerated() {
            if index == 0 {
                button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
            }
            if index > 0 {
                NSLayoutConstraint.activate([
                    button.topAnchor.constraint(equalTo: buttons[index - 1].bottomAnchor, constant: 5)
                ])
            }

            if index == buttons.count - 1 {
                button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
            }
        }
    }

    func updateUI(model: CouponViewCellModel) {
        offer1Button.setTitle(model.offer1.name, for: .normal)
        offer2Button.setTitle(model.offer2.name, for: .normal)
        offer3Button.setTitle(model.offer3.name, for: .normal)
        offer4Button.setTitle(model.offer4.name, for: .normal)
    }

    @objc func tapOnOffer1() {}
    @objc func tapOnOffer2() {}
    @objc func tapOnOffer3() {}
    @objc func tapOnOffer4() {}
}
