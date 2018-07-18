//
//  MortgagePromotionDatabaseManager.swift
//  DataCaptureApp
//
//  Created by Evgeny Mahnach on 7/16/18.
//  Copyright © 2018 Evgeny Mahnach. All rights reserved.
//

import RealmSwift

class MortgagePromotionDatabaseManager {
    
    fileprivate let realm = try! Realm()
    
    func save(object: MortgagePromotionPersonModel) {
        try! realm.write {
            realm.add(object)
        }
    }
    
    func save(objects: [MortgagePromotionPersonModel]) {
        try! realm.write {
            realm.add(objects)
        }
    }
    
    func get() -> Results<MortgagePromotionPersonModel> {
        return realm.objects(MortgagePromotionPersonModel.self)
    }
    
}
