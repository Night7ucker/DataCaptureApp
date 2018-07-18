//
//  DateExtension.swift
//  DataCaptureApp
//
//  Created by Stanislau Sakharchuk on 7/18/18.
//  Copyright © 2018 Stanislau Sakharchuk. All rights reserved.
//

import Foundation

extension Date {
    
    var dateAndTime: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM.dd.YYYY hh:mm"
        return dateFormatter.string(from: self)
    }
    
}
