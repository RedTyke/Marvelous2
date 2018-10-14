//
//  Character.swift
//  Marvelous
//
//  Created by John McNiffe on 18/08/2018.
//  Copyright © 2018 John McNiffe. All rights reserved.
//

import Foundation

struct Header: Codable {
    var code: Int
    var data: Results
    
}

struct Results: Codable {
    var count: Int
    var results: [Character]
}

struct Character: Codable {
    
    var name: String
    var description: String
    
    
    
    static func characterDetail(for character: String, completion: @escaping ([Character]) -> () ) {
        
        var characterArray: [Character] = []
        
        let jsonUrl = createURL(forCharacter: character)
        guard let url = URL(string: jsonUrl) else { return }
        print(url)
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                let results = try decoder.decode(Header.self, from: data)
                
                for character in results.data.results {
                    characterArray.append(character)
                    print("characterArray: Name:\(character.name)\n")
                }
                completion(characterArray)
                print("*** Data fetch complete ***")
                
                
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
            }.resume()
    }
    
}
