//
//  ViewController.swift
//  Marvelous
//
//  Created by John McNiffe on 15/08/2018.
//  Copyright © 2018 John McNiffe. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController, UITextFieldDelegate {
    
    var characterArray: [Character] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    
    
    @IBAction func goButtonPressed(_ sender: Any) {
        
        characterArray = []
        
        if let character = searchTextField.text {
            
            Character.characterDetail(for: character) { (results: [Character]) in
            
                for result in results {
                    self.characterArray.append(result)
                    print("\(result)\n\n")
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.resignFirstResponder()
        return false
    }
}

