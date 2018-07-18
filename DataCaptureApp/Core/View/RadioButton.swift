//
//  RadioButton.swift
//  DataCaptureApp
//
//  Created by Evgeny Mahnach on 7/14/18.
//  Copyright © 2018 Evgeny Mahnach. All rights reserved.
//

import UIKit

class RadioButton: UIButton {
    
    // - Flag
    var isChecked = false
    
    // - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        configure()
    }
    
}

// MARK: -
// MARK: - Configure

fileprivate extension RadioButton {
    
    func configure() {
        addAction()
    }
    
    func addAction() {
        addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton(sender: UIButton) {
        isChecked ? setImage(#imageLiteral(resourceName: "radio_button_checked"), for: .normal) : setImage(#imageLiteral(resourceName: "radio_button_unchecked"), for: .normal)
//        if isChecked == false {
//            isChecked = !isChecked
//            
//        }
    }
    
}
