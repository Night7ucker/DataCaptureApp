//
//  MortgageTextFieldCell.swift
//  DataCaptureApp
//
//  Created by Evgeny Mahnach on 7/14/18.
//  Copyright © 2018 Evgeny Mahnach. All rights reserved.
//

import UIKit

class MortgageTextFieldCell: UITableViewCell {
    
    @IBOutlet weak var infoTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(with placeholder: String) {
        infoTextField.placeholder = placeholder
    }
    
}
