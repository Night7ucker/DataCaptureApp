//
//  CSVDataManager.swift
//  DataCaptureApp
//
//  Created by Stanislau Sakharchuk on 7/14/18.
//  Copyright © 2018 Stanislau Sakharchuk. All rights reserved.
//

import Foundation
import CSV

class CSVDataManager {
    
    fileprivate var filePath = ""
    fileprivate var moneyCompetitionFilePath = ""
    
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
    
    func write(moneyCompetitionModel: MoneyCompetitionPersonModel) {
        if moneyCompetitionFilePath.isEmpty {
            createMoneyCompetitionFile()
        }
        
        let stream = OutputStream(toFileAtPath: moneyCompetitionFilePath, append: false)!
        let csv = try! CSVWriter(stream: stream)
        
        csv.beginNewRow()
        try! csv.write(row: [moneyCompetitionModel.name, moneyCompetitionModel.phone, moneyCompetitionModel.emailAddress])
        
        csv.stream.close()
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
        let fileName = "moneyCompetition.csv"
        let path = NSTemporaryDirectory().appending(fileName)
        moneyCompetitionFilePath = path
        FileManager.default.createFile(atPath: path, contents: nil, attributes: nil)
        
        let stream = OutputStream(toFileAtPath: moneyCompetitionFilePath, append: false)!
        let csv = try! CSVWriter(stream: stream)
        
        try! csv.write(row: ["Name", "Mobile phone", "Email"])
        
        csv.stream.close()
    }
    
}

