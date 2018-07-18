//
//  CSVDataManager.swift
//  DataCaptureApp
//
//  Created by Evgeny Mahnach on 7/14/18.
//  Copyright © 2018 Evgeny Mahnach. All rights reserved.
//

import Foundation
import CSV

class CSVDataManager {
    
    // - Manager / Service
    fileprivate let moneyTravelDatabaseManager = MoneyCompetitionDatabaseManager()
    fileprivate let mortgageDatabaseManager = MortgagePromotionDatabaseManager()
    
    // - Data
    fileprivate var filePath = ""
    fileprivate var moneyCompetitionFilePath = ""
    fileprivate var mortgagePromotionFilePath = ""
    
    func writeToFile() {
        let fileName = "file.csv"
        let path = NSTemporaryDirectory().appending(fileName)
        filePath = path
        FileManager.default.createFile(atPath: path, contents: nil, attributes: nil)
        let stream = OutputStream(toFileAtPath: path, append: false)!
        let csv = try! CSVWriter(stream: stream)
        try! csv.write(row: ["id", "name"])
        try! csv.write(row: ["1", "foo"])
        try! csv.write(row: ["1", "bar"])
        
        csv.stream.close()
    }
    
    func getLastMoneyTravelFilepath() -> String {
        return NSTemporaryDirectory().appending(moneyCompetitionFilePath)
    }
    
    func getLastMortgageFilePath() -> String {
        return NSTemporaryDirectory().appending(mortgagePromotionFilePath)
    }
    
    func writeMoneyTravel() -> String {
        let currentDate = Date()
        let fileName = "Travel Money Competition \(currentDate.dateAndTime).csv"
//        let path = getDocumentsDirectory().appending(fileName)
        let path = NSTemporaryDirectory().appending(fileName)
        moneyCompetitionFilePath = path
        FileManager.default.createFile(atPath: path, contents: nil, attributes: nil)
        
        let stream = OutputStream(toFileAtPath: moneyCompetitionFilePath, append: false)!
        let csv = try! CSVWriter(stream: stream)
        
        try! csv.write(row: ["Unique Identifier", "Name", "Mobile", "Email", "Post Code", "Facebook ID", "Instagram ID", "Twitter ID", "Consent"])
        
        let models = Array(moneyTravelDatabaseManager.get())
        
        for model in models {
            csv.beginNewRow()
            try! csv.write(row: [model.customerID, model.name, model.phone, model.emailAddress, model.postCode, model.facebookID, model.instagramID, model.twitterID, String(model.isNeededFormPopulation)])
        }
        
        print(moneyCompetitionFilePath)
        
        csv.stream.close()
        
        return moneyCompetitionFilePath
    }
    
    func writeMoneyMortgage() -> String {
        let currentDate = Date()
        let fileName = "Mortgage Promotion \(currentDate.dateAndTime).csv"
        let path = NSTemporaryDirectory().appending(fileName)
        mortgagePromotionFilePath = path
        FileManager.default.createFile(atPath: path, contents: nil, attributes: nil)
        
        let stream = OutputStream(toFileAtPath: mortgagePromotionFilePath, append: false)!
        let csv = try! CSVWriter(stream: stream)
        
        try! csv.write(row: ["Unique Identifier", "Name", "Mobile", "Email", "Post Code", "Best day to call", "Best time to call", "Buyer type", "Consent"])
        
        let models = Array(mortgageDatabaseManager.get())
        
        for model in models {
            csv.beginNewRow()
            try! csv.write(row: [model.customerID, model.name, model.phone, model.emailAddress, model.postCode, model.bestDayToCall, model.bestTimeToCall, model.buyerType, String(model.isNeededFormPopulation)])
        }
        
        print(mortgagePromotionFilePath)
        
        csv.stream.close()
        
        return mortgagePromotionFilePath
    }
    
    func getDataFromFile() {
        let stream = InputStream(fileAtPath: filePath)!
        let csv = try! CSVReader(stream: stream)
        while let row = csv.next() {
            print("\(row)")
        }
    }
    
}

// MARK: -
// MARK: - Methods

fileprivate extension CSVDataManager {
    
    func createMoneyCompetitionFile() {
        
    }
    
    func getDocumentsDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
}

