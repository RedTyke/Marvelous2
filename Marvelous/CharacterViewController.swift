import UIKit

class CharacterViewController: UICollectionViewController {

var characters: [Character] = []
 
/*
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
   */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        performSelector(inBackground: #selector(fetchJSON), with: nil)
        
        
    }
    
    
    @objc func fetchJSON() {
        
        let urlString = getAllCharactersURL()
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
                return
            }
            
        }
     fatalError("Failed to fetch JSON")
    }
    
    
    func parse(json: Data) {
        
        let decoder = JSONDecoder()
        
        if let results = try? decoder.decode(Header.self, from: json) {
            
            for character in results.data.results {
                characters.append(character)
                print("Arraycount: \(characters.count)")
                print("characterArray: Name:\(character.name)\n")
            }
            
            print("*** Data fetch complete ***")
            collectionView.performSelector(onMainThread: #selector(UICollectionView.reloadData), with: nil, waitUntilDone: false)
            
        } else {
            print("Error serializing json")
        }
    }
    
    

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Character", for: indexPath) as? CharacterCell else { fatalError("Unable to dequeue a Character Cell") }
    
        let character = characters[indexPath.item]
        cell.name.text = character.name
        
        
        let imageURL = character.thumbnail.path + "/portrait_medium.jpg"
        if let url = URL(string: imageURL) {
            cell.imageView.load(url: url)
        }
 
        
        return cell
    }
}
