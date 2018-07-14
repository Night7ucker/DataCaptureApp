//
//  AdminPanelCell.swift
//  DataCaptureApp
//
//  Created by Stanislau Sakharchuk on 7/14/18.
//  Copyright © 2018 Stanislau Sakharchuk. All rights reserved.
//

import UIKit

class AdminPanelCell: UITableViewCell {
    
    // - UI
    
    @IBOutlet weak var leadsCountLabel: UILabel!
    @IBOutlet weak var checkmarkImageView: UIImageView!
    
    // - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(with title: String, isChecked: Bool) {
        leadsCountLabel.text = "Leads: " + title
        checkmarkImageView.image = isChecked ? #imageLiteral(resourceName: "checkmark_checked") : #imageLiteral(resourceName: "checkmark_unchecked")
    }
    
}
