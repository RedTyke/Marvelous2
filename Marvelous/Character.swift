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
    
    
    static func characterDetail() -> [Character] {
        
        var characterArray: [Character] = []
        
        let jsonUrl = getAllCharactersURL()
        
        guard let url = URL(string: jsonUrl) else { fatalError("URL Failed") }
        print(url)
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { fatalError("No data returned") }
            
            do {
                let decoder = JSONDecoder()
                let results = try decoder.decode(Header.self, from: data)
                
                for character in results.data.results {
                    characterArray.append(character)
                    print("characterArray: Name:\(character.name)\n")
                }
                print("*** Data fetch complete ***")
                
                
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
            }.resume()
        
        return characterArray
    }
    
}

struct Thumbnail: Codable {
    var path: String
    
    // Add '/portrait_medium.jpg' to end for a 100x150
    // Add _xlarge, _fantastic, _uncanny, _incredible for other variants
}
