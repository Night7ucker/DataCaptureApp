//
//  MoneyCompetitionDatabaseManager.swift
//  DataCaptureApp
//
//  Created by Evgeny Mahnach on 7/14/18.
//  Copyright © 2018 Evgeny Mahnach. All rights reserved.
//

import RealmSwift

class MoneyCompetitionDatabaseManager {
    
    fileprivate let realm = try! Realm()
    
    func save(object: MoneyCompetitionPersonModel) {
        try! realm.write {
            realm.add(object)
        }
    }
    
    func save(objects: [MoneyCompetitionPersonModel]) {
        try! realm.write {
            realm.add(objects)
        }
    }
    
    func get() -> Results<MoneyCompetitionPersonModel> {
        return realm.objects(MoneyCompetitionPersonModel.self)
    }
    
}
