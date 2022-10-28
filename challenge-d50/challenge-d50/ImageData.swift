//
//  ImageData.swift
//  challenge-d50
//
//  Created by Patrick on 12.07.2022..
//

import UIKit

struct ImageData: Codable {
    var caption: String
    var image: String

    init (caption: String, image: String) {
        self.image = image
        self.caption = caption
    }
}
