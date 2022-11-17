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

enum APIError: Error {
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()

    func getTrendingMoview(completion: @escaping (Result<[MediaObject], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)3/trending/movie/day?api_key=\(Constants.API_KEY)") else {return}

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data,
            error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TmdbResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }

        task.resume()
    }

    func getTrendingTvs(completion: @escaping (Result<[MediaObject], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)3/trending/tv/day?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data,
            error == nil else {
                return
            }
            do {
//                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                let results = try JSONDecoder().decode(TmdbResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
//                print(error)
            }
        }

        task.resume()
    }

    func getUpcomingMovies(completion: @escaping (Result<[MediaObject], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)3/movie/upcoming?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data,
            error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TmdbResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }

        task.resume()
    }

    func getPopularMovies(completion: @escaping (Result<[MediaObject], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)3/movie/popular?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data,
            error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TmdbResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }

        task.resume()
    }

    func getTopRatedMovies(completion: @escaping (Result<[MediaObject], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)3/movie/top_rated?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data,
            error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TmdbResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }

        task.resume()
    }
}
