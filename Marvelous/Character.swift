//
//  Character.swift
//  Marvelous
//
//  Created by John McNiffe on 18/08/2018.
//  Copyright © 2018 John McNiffe. All rights reserved.
//

import Foundation

struct Header: Codable {
    //var code: Int
    var data: Results
    
}

struct Results: Codable {
    //var count: Int
    var results: [Character]
}

struct Character: Codable {
    
    var name: String
    var description: String
    var thumbnail: Thumbnail
}

struct Thumbnail: Codable {
    var path: String
    
    // Add '/portrait_medium.jpg' to end for a 100x150
    // Add _xlarge, _fantastic, _uncanny, _incredible for other variants
}
