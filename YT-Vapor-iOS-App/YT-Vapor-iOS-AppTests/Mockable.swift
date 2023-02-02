//
//  Mockable.swift
//  YT-Vapor-iOS-AppTests
//
//  Created by Patrick on 01.02.2023..
//

import Foundation

protocol Mockable: AnyObject {
    var bundle: Bundle { get }

    func loadJson<T: Decodable>(filename: String, type: T.Type) -> [T]
}

extension Mockable {
    var bundle: Bundle {
        return Bundle(for: type(of: self))
    }

    func loadJson<T: Decodable>(filename: String, type: T.Type) -> [T] {
        guard let path = bundle.url(forResource: filename, withExtension: ".json") else { fatalError("mock file failed to load")}

        do {
            let data = try Data(contentsOf: path)
            let decodedObject = try JSONDecoder().decode([T].self, from: data)
            return decodedObject
        } catch {
            print("❌ \(error)")
        }

        return []
    }
}
