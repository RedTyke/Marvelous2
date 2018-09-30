//
//  SelectViewController+tableView.swift
//  Marvelous
//
//  Created by John McNiffe on 29/09/2018.
//  Copyright © 2018 John McNiffe. All rights reserved.
//

import UIKit

extension SelectViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let characterCount = characterArray.count
        
        if characterCount == 0 {
            return 1
        } else {
        return characterArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if characterArray.count == 0 {
            
            return cell
        } else {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath)
        
        let character = characterArray[indexPath.row]
        cell.textLabel?.text = character.name
        
        return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected row \(indexPath)")
    }
    
    
    
    
}
