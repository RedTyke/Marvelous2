//
//  CharacterViewController.swift
//  Marvelous
//
//  Created by John McNiffe on 17/03/2019.
//  Copyright © 2019 John McNiffe. All rights reserved.
//

import UIKit



class CharacterViewController: UICollectionViewController {

    
    
    var characters: [Character] = []
   
    
override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
    // FIX:  This is not running as array in completion handler is empty...it's not treating it correctly....nothing is being pased back.....
        Character.characterDetail { characterArray in
            
            for result in characterArray {
                self.characters.append(result)
            print("Badger")
            }
        
    
    DispatchQueue.main.async {
        print("EY UP!!!  Count \(self.characters.count)")
        self.collectionView.reloadData()
    }
            
    }
    
    
    print("This happened.........")
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return characters.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Character", for: indexPath) as? CharacterCell else { fatalError("Unable to dequeue a Character Cell") }
    
        let character = characters[indexPath.item]
        cell.name.text = character.name
        
        /*
        let imageURL = character.thumbnail.path + "/portrait_medium.jpg"
        if let url = URL(string: imageURL) {
        let request = URLRequest(url: url)
        cell.imageWebView.load(request)
        }
 */
        
        return cell
    }
}
