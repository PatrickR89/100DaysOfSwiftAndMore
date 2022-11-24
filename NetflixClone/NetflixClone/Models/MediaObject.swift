//
//  MediaObject.swift
//  NetflixClone
//
//  Created by Patrick on 17.11.2022..
//

import Foundation

struct TmdbResponse: Codable {
    let results: [MediaObject]
}

struct MediaObject: Codable {
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let vote_average: Double
    let release_date: String?

}
