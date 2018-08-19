//
//  Character.swift
//  Marvelous
//
//  Created by John McNiffe on 18/08/2018.
//  Copyright © 2018 John McNiffe. All rights reserved.
//

import Foundation


struct Character {
    
    var name: String
    var description: String
    

    enum SerialisationError: Error {
        case missing (String)
        case invalid (String, Any)
    }
    
    init(json: [String: Any]) throws {
        guard let name = json["name"] as? String else {throw SerialisationError.missing("Character not available")}
        guard let description = json["description"] as? String else {throw SerialisationError.missing("Character not available")}
        
        self.name = name
        self.description = description
        
    }
    

static func characterDetail(for character: String, completion: @escaping ([Character]) -> ()) {
        let url = createURL(forCharacter: character)
        
        let request = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: request) { (data:Data?, response:URLResponse?, error:Error?) in
            
            var characterArray:[Character] = []
            
            if let data = data {
                
                do {
                    
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                      if let data = json["data"] as? [String:Any] {
                            if let results = data["results"] as? [[String:Any]] {
                                for dataPoint in results {
                                    if let characterObject = try? Character(json: dataPoint) {
                                        characterArray.append(characterObject)
                                    }
                                }
                            }
                        }
                    }
                } catch {
                    print(error.localizedDescription)
                }
                completion(characterArray)
            }
        }
        task.resume()
}
}
