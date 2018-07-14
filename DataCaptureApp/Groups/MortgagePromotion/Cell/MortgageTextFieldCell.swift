//
//  MortgageTextFieldCell.swift
//  DataCaptureApp
//
//  Created by Stanislau Sakharchuk on 7/14/18.
//  Copyright © 2018 Stanislau Sakharchuk. All rights reserved.
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
