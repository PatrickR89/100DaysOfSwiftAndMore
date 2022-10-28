//
//  Person.swift
//  project10
//
//  Created by Patrick on 14.06.2022..
//

import UIKit

//MARK: class: Person with NSCoding

//class Person: NSObject, NSCoding {
//    var name: String
//    var image: String
//
//    init(name: String, image: String) {
//        self.name = name
//        self.image = image
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        name = aDecoder.decodeObject(forKey: "name") as? String ?? ""
//        image = aDecoder.decodeObject(forKey: "image") as? String ?? ""
//    }
//
//    func encode(with aCoder: NSCoder) {
//        aCoder.encode(name, forKey: "name")
//        aCoder.encode(image, forKey: "image")
//    }
//}

//MARK: class: Person with Coding


class Person: NSObject, Codable {
    var name: String
    var image: String

    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}

