//
//  DetailViewController.swift
//  Marvelous
//
//  Created by John McNiffe on 24/03/2019.
//  Copyright © 2019 John McNiffe. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

  var descriptionLabel: UILabel!
  var name: String!
  var detail: String!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      view.backgroundColor = UIColor.red
      title = name
      
      descriptionLabel = UILabel()
      descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
      descriptionLabel.numberOfLines = 0
      
    
      descriptionLabel?.text = detail
      view.addSubview(descriptionLabel)
      
      descriptionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
      descriptionLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
      descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
      descriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
      
        // Do any additional setup after loading the view.
    }
    


}
