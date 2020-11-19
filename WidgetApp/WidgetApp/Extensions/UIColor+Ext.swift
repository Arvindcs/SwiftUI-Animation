//
//  UIColor+Ext.swift
//  WidgetApp
//
//  Created by Arvind on 17/11/20.
//  Copyright © 2020 Arvind. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0xFF00) >> 8) / 255.0
        let blue = CGFloat(hex & 0xFF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    func getHexStr() -> String {
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        getRed(&r, green: &g, blue: &b, alpha: &alpha)
        
        let rgb: Int = Int(r*255)<<16 | Int(g*255)<<8 | Int(b*255)<<0
        return "\(NSString(format: "%06x", rgb))".uppercased()
    }
}
