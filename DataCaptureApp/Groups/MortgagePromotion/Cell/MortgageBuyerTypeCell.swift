//
//  MortgageBuyerTypeCell.swift
//  DataCaptureApp
//
//  Created by Stanislau Sakharchuk on 7/14/18.
//  Copyright © 2018 Stanislau Sakharchuk. All rights reserved.
//

import UIKit

class MortgageBuyerTypeCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var radioButtonImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(with title: String, isChecked: Bool) {
        titleLabel.text = title
        radioButtonImageView.image = isChecked ? #imageLiteral(resourceName: "radio_button_checked") : #imageLiteral(resourceName: "radio_button_unchecked")
    }
    
}
