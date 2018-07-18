//
//  StoryboardEnum.swift
//  DataCaptureApp
//
//  Created by Evgeny Mahnach on 7/14/18.
//  Copyright © 2018 Evgeny Mahnach. All rights reserved.
//

import Foundation

enum Storyboard: String {
    
    case moneyCompetition = "MoneyCompetition"
    case adminLogin = "AdminLogin"
    case adminPanel = "AdminPanel"
    case mortgage = "MortgagePromotion"
    
    var filename: String {
        return rawValue
    }
    
}
