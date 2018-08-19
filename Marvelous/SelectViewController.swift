//
//  ViewController.swift
//  Marvelous
//
//  Created by John McNiffe on 15/08/2018.
//  Copyright © 2018 John McNiffe. All rights reserved.
//

import UIKit




class SelectViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBAction func goButtonPressed(_ sender: Any) {
        print("Let's go search for some stuff")
    }
    var resultsCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
       /* Character.characterDetail(for: "Iron") { (results: [Character]) in
            for result in results {
                print("\(result)\n\n")
                print("*****Number of Results: \(results.count)")
 
 
            }
        } */
        tableView.dataSource = self
        tableView.delegate = self
        searchTextField.delegate = self
        
        
        // hide keyboard
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        gestureRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(gestureRecognizer)
        
        
    }

    @objc func hideKeyboard(_ gestureRecognizer: UIGestureRecognizer) {
        searchTextField.resignFirstResponder()
        print("Touching!")
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.resignFirstResponder()
        return false
    }
    
    
    
    
    func searchCharacter() {
        
    }
    
    
    // MARK: - Table View Delegates
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath)
        
        cell.textLabel?.text = "Captain America"
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected row \(indexPath)")
    }
    
    

}

