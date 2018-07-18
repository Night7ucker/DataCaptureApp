//
//  MoneyCompetitionPersonModel.swift
//  DataCaptureApp
//
//  Created by Evgeny Mahnach on 7/14/18.
//  Copyright © 2018 Evgeny Mahnach. All rights reserved.
//

import RealmSwift

class MoneyCompetitionPersonModel: Object {
    
    @objc dynamic var customerID = ""
    
    @objc dynamic var name = ""
    @objc dynamic var phone = ""
    @objc dynamic var emailAddress = ""
    @objc dynamic var postCode = ""
    
    @objc dynamic var instagramID = ""
    @objc dynamic var facebookID = ""
    @objc dynamic var twitterID = ""
    
    @objc dynamic var isNeededFormPopulation = false
    
}
