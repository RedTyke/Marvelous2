//
//  JSON.swift
//  Marvelous
//
//  Created by John McNiffe on 18/08/2018.
//  Copyright © 2018 John McNiffe. All rights reserved.
//

import Foundation
import CryptoSwift

struct MarvelKeys {
    static let publicKey = "f9404ee389dfa4321f9aa13c03945ac2"
    static let privateKey = "1c65af91f41cb87f5b84d424254b73293ea89d4c"
}

func hashString(string: String) -> String {
    let encodedText = string.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
    return encodedText
}

func getAllCharactersURL() -> String {
    
    let ts = Date().timeIntervalSince1970.description
    let hash = "1" + MarvelKeys.privateKey + MarvelKeys.publicKey
    let urlClose = "&apikey=\(MarvelKeys.publicKey)"
    let mainUrl = "https://gateway.marvel.com/v1/public/characters?limit=100&offset=100&ts=1\(urlClose)&hash=\(hash.md5())"
    
    // use limit and pull back - max pull back 100
    
    return mainUrl
}
