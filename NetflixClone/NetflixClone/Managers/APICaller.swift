//
//  APICaller.swift
//  NetflixClone
//
//  Created by Patrick on 17.11.2022..
//

import Foundation


struct Constants {
    static let API_KEY = ""
    static let baseURL = "https://api.themoviedb.org/"
}

enum APIError {
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()

    func getTrendingMoview(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)3/trending/all/day?api_key=\(Constants.API_KEY)") else {return}

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data,
            error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }
}
