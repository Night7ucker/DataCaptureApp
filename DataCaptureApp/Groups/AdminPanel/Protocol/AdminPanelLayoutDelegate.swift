//
//  AdminPanelLayoutDelegate.swift
//  DataCaptureApp
//
//  Created by Evgeny Mahnach on 7/16/18.
//  Copyright © 2018 Evgeny Mahnach. All rights reserved.
//

import UIKit

protocol AdminPanelLayoutDelegate: class {
    
    func didTapTravelButton(isDownload: Bool, isChecked: Bool)
    func didTapMortgageButton(isDownload: Bool, isChecked: Bool)
    
}
