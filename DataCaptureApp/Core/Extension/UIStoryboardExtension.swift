//
//  UIStoryboardExtension.swift
//  DataCaptureApp
//
//  Created by Stanislau Sakharchuk on 7/14/18.
//  Copyright © 2018 Stanislau Sakharchuk. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.filename, bundle: bundle)
    }
    
}
