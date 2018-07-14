//
//  UIViewExtension.swift
//  DataCaptureApp
//
//  Created by Stanislau Sakharchuk on 7/14/18.
//  Copyright © 2018 Stanislau Sakharchuk. All rights reserved.
//

import UIKit

extension UIView {
    
    func animateAppearing(with inset: CGFloat = 0) {
        frame.origin.y += frame.height
        isHidden = false
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.frame.origin.y -= strongSelf.frame.height
            }, completion: nil)
    }
    
    func animateDisappearing(with inset: CGFloat) {
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.frame.origin.y += strongSelf.frame.height
        }) { [weak self] _ in
            self?.isHidden = true
        }
    }
    
}
