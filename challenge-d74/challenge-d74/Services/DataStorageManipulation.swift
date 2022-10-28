//
//  DataStorage.swift
//  challenge-d74
//
//  Created by Patrick on 22.08.2022..
//

import UIKit

class DataStorageManipulation {

    static let shared = DataStorageManipulation()

    private let notesFile = FileManager().getFilePath("notesJSON.txt")


    func encodeAndSave(_ data: [Note]) {
        do {
            let dataJson = try JSONEncoder().encode(data)
            try dataJson.write(to: notesFile)
        } catch {
            print("Error occurred during file save: \(error)")
        }
    }

    func loadAndDecode () -> [Note] {
        do {
            let response = try String(contentsOf: notesFile)
            let data = Data(response.utf8)
            let notes = try JSONDecoder().decode([Note].self, from: data)
            return notes
        } catch {
            print("Error occurred during file load: \(error)")
            let notes: [Note] = []
            return notes
        }
    }

    func test() {
        print("sss")
    }
}
