import UIKit
import CryptoSwift

// MARVEL.COM API GET

struct MarvelKeys {
    static let publicKey = "f9404ee389dfa4321f9aa13c03945ac2"
    static let privateKey = "1c65af91f41cb87f5b84d424254b73293ea89d4c"
}

let name = "Spider"
let ts = "1"
// let ts = Date().timeIntervalSince1970.description
let hash = ts + MarvelKeys.privateKey + MarvelKeys.publicKey
let urlClose = "&apikey=\(MarvelKeys.publicKey)"

let hashUTF = hash.utf8


func hashString(string: String) -> String {
    let encodedText = string.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
    return encodedText
}

var mainUrl = "https://gateway.marvel.com/v1/public/characters?nameStartsWith=Spider&ts=\(ts)\(urlClose)&hash=\(hash.md5())"
//let mainURLEncrypted = mainUrl.lowercased().md5()



print("Result: \(mainUrl)")


