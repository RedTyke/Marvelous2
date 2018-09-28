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

func createURL(forCharacter character: String) -> String {

let ts = Date().timeIntervalSince1970.description
let hash = ts + MarvelKeys.privateKey + MarvelKeys.publicKey
let urlClose = "&apikey=\(MarvelKeys.publicKey)"
let mainUrl = "https://gateway.marvel.com/v1/public/characters?nameStartsWith=\(character)&ts=\(ts)\(urlClose)&hash=\(hash.md5())"
    
    return mainUrl
}

func hashString(string: String) -> String {
    let encodedText = string.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
    return encodedText
}
