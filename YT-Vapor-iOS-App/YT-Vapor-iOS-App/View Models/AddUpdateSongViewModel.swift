//
//  AddUpdateSongViewModel.swift
//  YT-Vapor-iOS-App
//
//  Created by Mikaela Caron on 10/19/21.
//

import SwiftUI

final class AddUpdateSongViewModel: ObservableObject {
    @Published var songTitle = ""
    
    var songID: UUID?
    
    var isUpdating: Bool {
        songID != nil
    }
    
    var buttonTitle: String {
        songID != nil ? "Update Song" : "Add Song"
    }
    
    var httpClient: HttpClientProtocol

    init(_ httpClient: HttpClientProtocol) {
        self.httpClient = httpClient
    }
    
    init(_ httpClient: HttpClientProtocol, currentSong: Song) {
        self.songTitle = currentSong.title
        self.songID = currentSong.id
        self.httpClient = httpClient
    }
    
    func addSong() async throws {
        let urlString = Constants.baseURL + Endpoints.songs
        
        guard let url = URL(string: urlString) else {
            throw HttpError.badURL
        }
        
        let song = Song(id: nil, title: songTitle)
        
        try await httpClient.sendData(to: url,
                                             object: song,
                                             httpMethod: HttpMethods.POST.rawValue)
    }
    
    func addUpdateAction(completion: @escaping () -> Void) {
        Task {
            do {
                if isUpdating {
                     try await updateSong()
                } else {
                    try await addSong()
                }
            } catch {
                print("❌ Error: \(error)")
            }
            completion()
        }
    }
    
    func updateSong() async throws {
        let urlString = Constants.baseURL + Endpoints.songs
        guard let url = URL(string: urlString) else {
            throw HttpError.badURL
        }
        
        let songToUpdate = Song(id: songID, title: songTitle)
        try await httpClient.sendData(to: url, object: songToUpdate, httpMethod: HttpMethods.PUT.rawValue)
    }

    func isValidSong() -> Bool {

        return songTitle.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? false : true

//        if songTitle == "" {
//            return false
//        } else {
//            return true
//        }
    }
}
