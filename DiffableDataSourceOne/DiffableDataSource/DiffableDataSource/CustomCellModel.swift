//
//  CustomCellModel.swift
//  DiffableDataSource
//
//  Created by Patrick on 28.10.2022..
//

import Foundation

protocol CustomCellModel {
    var text: String {get}
    var secondaryText: String? {get}
}

extension CustomCellModel {
    var secondaryText: String? {nil}
}
