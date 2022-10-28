//
//  UITableViewDiffableDataSource+Extension.swift
//  DiffableDataSource
//
//  Created by Patrick on 28.10.2022..
//

import UIKit

extension UITableViewDiffableDataSource {
    func selectedIndexPaths<T: Hashable>(_ selection: SelectionOption<T>,
                                         _ transform: (T) -> ItemIdentifierType) -> [IndexPath] {
        selection.values
            .filter { selection.selectedValues.contains($0)}
            .map { transform($0)}
            .compactMap {indexPath(for: $0)}
    }
}
