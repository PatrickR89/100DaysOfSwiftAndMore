//
//  DataStorage.swift
//  challenge-d90
//
//  Created by Patrick on 30.08.2022..
//

import UIKit

class DataStorage {
    static let shared = DataStorage()

    private let filePath = FileManager.default.getFilePath("memes.json")

    func saveFile(save data: [Meme]) {
        do {
            let data = try JSONEncoder().encode(data)
            try data.write(to: filePath)
        } catch {
            print("Error occured when saving")
        }
    }

    func loadFile() -> [Meme] {
        do {
            let response = try String(contentsOf: filePath)
            let data = Data(response.utf8)
            let memes = try JSONDecoder().decode([Meme].self, from: data)
            return memes
        } catch {
            print("Error occurred when loading")
            return []
        }
    }
}
