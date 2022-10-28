//
//  UITableViewCell+Extension.swift
//  DiffableDataSource
//
//  Created by Patrick on 28.10.2022..
//

import UIKit

extension UITableViewCell {
    static var reuseIdentifier: String {
        String(describing: self)
    }

    var reuseIdentifier: String {
        type(of: self).reuseIdentifier
    }
}
