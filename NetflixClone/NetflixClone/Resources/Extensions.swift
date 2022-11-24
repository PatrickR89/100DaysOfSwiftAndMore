//
//  Extensions.swift
//  NetflixClone
//
//  Created by Patrick on 17.11.2022..
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
