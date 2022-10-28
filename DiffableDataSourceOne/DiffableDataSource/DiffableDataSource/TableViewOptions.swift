//
//  TableViewOptions.swift
//  DiffableDataSource
//
//  Created by Patrick on 28.10.2022..
//

import Foundation

enum NumberOption: String, CaseIterable {
    case one
    case two
    case three
}

extension NumberOption: CustomCellModel {
    var text: String {rawValue}
}

enum LetterOption: String, CaseIterable {
    case a
    case b
    case c
    case d
}

extension LetterOption: CustomCellModel {
    var text: String {rawValue}
}
