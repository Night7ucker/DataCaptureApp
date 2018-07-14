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
    
    func writeToFile() {
        let stream = OutputStream(toFileAtPath: "/path/to/file.csv", append: false)!
        let csv = try! CSVWriter(stream: stream)
        
        try! csv.write(row: ["id", "name"])
        try! csv.write(row: ["1", "foo"])
        try! csv.write(row: ["1", "bar"])
        
        csv.stream.close()
    }
    
}
