//
//  CharacterDetail.swift
//  Marvelous
//
//  Created by John McNiffe on 17/03/2019.
//  Copyright © 2019 John McNiffe. All rights reserved.
//

import UIKit

class CharacterDetail: NSObject {
    var name: String
    var details: String
    var imageURL: String
    
    init(name: String, details: String, imageURL: String) {
        self.name = name
        self.details = details
        self.imageURL = imageURL
    }
}
