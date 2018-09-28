//
//  Character.swift
//  Marvelous
//
//  Created by John McNiffe on 18/08/2018.
//  Copyright © 2018 John McNiffe. All rights reserved.
//

import Foundation


struct Results: Codable {
    var results: [Character]
}

struct Character: Codable {
    
    var name: String
    var description: String
    
    
    static func characterDetail(for character: String, completion: @escaping ([Character]) -> ()) {
        let jsonUrl = createURL(forCharacter: character)
        guard let url = URL(string: jsonUrl) else { return }
        print (url)
        
        var characterArray: [Character] = []
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let characters = try decoder.decode([Character].self, from: data)
                // is order correct
                for character in characters {
                    characterArray.append(character)
                }
                
                print(characterArray)
                
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
            
            }.resume()
    }
}
    

