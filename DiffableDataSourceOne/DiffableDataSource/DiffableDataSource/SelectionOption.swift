//
//  SelectionOption.swift
//  DiffableDataSource
//
//  Created by Patrick on 28.10.2022..
//

import Foundation

struct SelectionOption<T: Hashable> {

    var values: [T]
    var selectedValues: [T]
    var multipleSelection: Bool

    init(_ values: [T], selected: [T] = [], multiple: Bool = false) {
        self.values = values
        self.selectedValues = selected
        self.multipleSelection = multiple
    }

    mutating func toggle(_ value: T) {
        guard multipleSelection else {
            selectedValues = [value]
            return
        }

        if selectedValues.contains(value) {
            selectedValues = selectedValues.filter { $0 != value}
        } else {
            selectedValues.append(value)
        }
    }
}
