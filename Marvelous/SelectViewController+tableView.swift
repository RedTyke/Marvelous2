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
        if characterArray.count == 0 {
            return 1
        } else {
            return characterArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if characterArray.count == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoResultCell", for: indexPath) as! NoResultTableViewCell
            return cell
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "resultsCell", for: indexPath) as! ResultTableViewCell
            let character = characterArray[indexPath.row]
            
            cell.Namelabel.text = character.name
            
            
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if characterArray.count == 0 {
            return CGFloat(80)
        } else {
            return CGFloat(50)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected row \(indexPath)")
    }
    
    
    
    
}
