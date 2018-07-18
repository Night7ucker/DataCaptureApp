//
//  AdminPanelMortgageCell.swift
//  DataCaptureApp
//
//  Created by Evgeny Mahnach on 7/16/18.
//  Copyright © 2018 Evgeny Mahnach. All rights reserved.
//

import UIKit

class AdminPanelMortgageCell: UITableViewCell {
    
    // - UI
    
    @IBOutlet weak var sendToSalesforceButton: RadioButton!
    @IBOutlet weak var downloadFileButton: RadioButton!
    @IBOutlet weak var leadsAmountLabel: UILabel!
    
    // - Delegate
    weak var delegate: AdminPanelLayoutDelegate!
    
    // - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // - API
    
    func set(with amount: Int) {
        leadsAmountLabel.text = String(amount)
    }
    
    // - Action
    
    @IBAction func downloadFIleButtonAction(_ sender: RadioButton) {
        sender.isChecked = !sender.isChecked
        sender.isChecked ? sender.setImage(#imageLiteral(resourceName: "admin_panel_checkmark_checked"), for: .normal) : sender.setImage(#imageLiteral(resourceName: "admin_panel_checkmark_unchecked"), for: .normal)
        delegate.didTapMortgageButton(isDownload: true, isChecked: sender.isChecked)
    }
    
    @IBAction func sendToSalesforceButtonAction(_ sender: RadioButton) {
        sender.isChecked = !sender.isChecked
        sender.isChecked ? sender.setImage(#imageLiteral(resourceName: "admin_panel_checkmark_checked"), for: .normal) : sender.setImage(#imageLiteral(resourceName: "admin_panel_checkmark_unchecked"), for: .normal)
        delegate.didTapMortgageButton(isDownload: false, isChecked: sender.isChecked)
    }
    
}
