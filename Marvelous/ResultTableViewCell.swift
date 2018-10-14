//
//  ResultTableViewCell.swift
//  Marvelous
//
//  Created by John McNiffe on 01/10/2018.
//  Copyright © 2018 John McNiffe. All rights reserved.
//

import UIKit

class ResultTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        
    }
    
    var Namelabel: UILabel = {
        var label = UILabel()
        label.text = "Default"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupViews() {
        backgroundColor = .red
        addSubview(Namelabel)
        Namelabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        Namelabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        Namelabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        Namelabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 

}
