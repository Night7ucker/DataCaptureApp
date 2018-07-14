//
//  MortgagePromotionPersonModel.swift
//  DataCaptureApp
//
//  Created by Stanislau Sakharchuk on 7/14/18.
//  Copyright © 2018 Stanislau Sakharchuk. All rights reserved.
//

import RealmSwift

class MortgagePromotionPersonModel: Object {
    
    @objc dynamic var name = ""
    @objc dynamic var phone = ""
    @objc dynamic var emailAddress = ""
    
    @objc dynamic var bestDayToCall = ""
    @objc dynamic var bestTimeToCall = ""
    
    @objc dynamic var buyerType = ""
    
}
