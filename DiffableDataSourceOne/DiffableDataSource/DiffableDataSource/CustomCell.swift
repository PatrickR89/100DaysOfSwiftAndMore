//
//  CustomCell.swift
//  DiffableDataSource
//
//  Created by Patrick on 28.10.2022..
//

import UIKit

class CustomCell: UITableViewCell {

    var model: CustomCellModel?

    override func updateConfiguration(using state: UICellConfigurationState) {
        super.updateConfiguration(using: state)

        var contentConfig = defaultContentConfiguration().updated(for: state)
        contentConfig.text = model?.text
        contentConfig.secondaryText = model?.secondaryText

        contentConfig.imageProperties.tintColor = .systemBlue
        contentConfig.image = UIImage(systemName: "circle")

        if state.isHighlighted || state.isSelected {
            contentConfig.image = UIImage(systemName: "checkmark.circle.fill")
        }

        contentConfiguration = contentConfig
    }
}
