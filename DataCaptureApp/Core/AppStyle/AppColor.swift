//
//  AppColor.swift
//  DataCaptureApp
//
//  Created by Evgeny Mahnach on 7/16/18.
//  Copyright © 2018 Evgeny Mahnach. All rights reserved.
//

import UIKit

enum AppColor {
    
    // MARK: -
    // MARK: - Colors
    
    static let mainGreenColor = AppColor.color(fromHex: "77BC1F")
    static let mainRedColor = AppColor.color(fromHex: "E61B3D")
    static let changePasswordButtonBorderColor = AppColor.color(fromHex: "77BC1F", alpha: 0.4)
    static let tabBarInactiveColor = AppColor.color(fromHex: "ABB1B6")
    static let grayAlertMessageColor = AppColor.color(fromHex: "8A8A8F", alpha: 1)
    static let cursorGreenColor = AppColor.color(fromHex: "77BC1F")
    static let textFieldBorderColor = AppColor.color(fromHex: "DCE0E4")
    static let barButtonItemGrayColor = AppColor.color(fromHex: "8A8A8F")
    static let barButtonItemGreenColor = AppColor.color(fromHex: "77BC1F")
    static let backArrowGreyColor = AppColor.color(fromHex: "ABB1B6")
    static let backgoundViewLightGreyColor = AppColor.color(fromHex: "EFF2F4")
    static let borderCodeViewsGreyColor = AppColor.color(fromHex: "8C96A1")
    static let borderCodeViewsLightGreyColor = AppColor.color(fromHex: "D5DBE2")
    static let borderCodeViewsGreenColor = AppColor.color(fromHex: "77BC1F")
    static let borderCodeViewsRedColor = AppColor.color(fromHex: "E61B3D")
    static let unselectedGreen = AppColor.color(fromHex: "C6F28A")
    static let sectionBackground = AppColor.color(fromHex: "EFF2F4")
    static let buttonBorder = AppColor.color(fromHex: "9CC9F6")
    static let promcoodeRed = AppColor.color(fromHex: "F36F21")
    static let orange = AppColor.color(fromHex: "F19517")
    static let lightGray = AppColor.color(fromHex: "CDD1D4")
    static let gray = AppColor.color(fromHex: "D8DBDE")
    static let searchBarBackground = AppColor.color(fromHex: "D8DBDE")
    static let searchBarPlaceholderText = AppColor.color(fromHex: "A0A9B0")
    static let viewModelBorder = AppColor.color(fromHex: "E8E8E8")
    static let yellow = AppColor.color(fromHex: "FFEA00")
    
    static func white(alpha: CGFloat = 1.0) -> UIColor {
        return self.color(fromHex: "ffffff", alpha: alpha)
    }
    
    static func black(alpha: CGFloat = 1.0) -> UIColor {
        return AppColor.color(fromHex: "000000", alpha: alpha)
    }
    
    static func warmGrey(alpha: CGFloat = 1.0) -> UIColor {
        return AppColor.color(fromHex: "8c8c8c", alpha: alpha)
    }
    
    static func transparentBlack(alpha: CGFloat) -> UIColor {
        return AppColor.color(fromHex: "000000", alpha: alpha)
    }
    
    static func color(fromHex hex: String, alpha: CGFloat = 1.0) -> UIColor {
        let cString: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines as CharacterSet).uppercased()
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
    
}
