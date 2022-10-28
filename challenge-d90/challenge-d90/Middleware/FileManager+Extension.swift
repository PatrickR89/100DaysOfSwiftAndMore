//
//  FileManager+Extension.swift
//  challenge-d90
//
//  Created by Patrick on 26.08.2022..
//

import UIKit

extension FileManager {
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths [0]
    }

    func getFilePath(_ name: String) -> URL {
        let filepath = getDocumentsDirectory().appendingPathComponent(name)
        return filepath
    }
}
