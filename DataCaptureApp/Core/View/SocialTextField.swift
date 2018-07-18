//
//  SocialTextField.swift
//  DataCaptureApp
//
//  Created by Evgeny Mahnach on 7/15/18.
//  Copyright © 2018 Evgeny Mahnach. All rights reserved.
//

import UIKit

class SocialTextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 48, bottom: 0, right: 5);
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
}
