//
//  TableBaceCell.swift
//  MyNetflix
//
//  Created by Vakhtangi Beridze on 5/8/18.
//  Copyright © 2018 22Round. All rights reserved.
//

import Foundation
import UIKit


protocol TableViewCellProtocol {
    
}

class TableBaseCell: UITableViewCell {
    
    let nameLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "Preview"
        label.textColor = .red
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
         setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupViews() {
        
    }
}
