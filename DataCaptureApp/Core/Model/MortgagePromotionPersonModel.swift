//
//  MortgagePromotionPersonModel.swift
//  DataCaptureApp
//
//  Created by Evgeny Mahnach on 7/14/18.
//  Copyright © 2018 Evgeny Mahnach. All rights reserved.
//

import RealmSwift

class MortgagePromotionPersonModel: Object {
    
    @objc dynamic var customerID = ""
    
    @objc dynamic var name = ""
    @objc dynamic var phone = ""
    @objc dynamic var emailAddress = ""
    @objc dynamic var postCode = ""
    
    @objc dynamic var bestDayToCall = ""
    @objc dynamic var bestTimeToCall = ""
    
    @objc dynamic var buyerType = ""
    
    @objc dynamic var isNeededFormPopulation = false

}
