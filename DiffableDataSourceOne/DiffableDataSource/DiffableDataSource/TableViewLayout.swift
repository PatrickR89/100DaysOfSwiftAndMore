//
//  TableViewLayout.swift
//  DiffableDataSource
//
//  Created by Patrick on 28.10.2022..
//

import Foundation

enum Section: Hashable {
    case numbers
    case letters
}

enum SectionItem: Hashable {
    case number(NumberOption)
    case letter(LetterOption)
}

struct SectionData {
    var key: Section
    var values: [SectionItem]
}
