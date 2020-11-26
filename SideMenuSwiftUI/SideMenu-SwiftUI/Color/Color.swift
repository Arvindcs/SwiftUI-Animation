//
//  Color.swift
//  SideMenu-SwiftUI
//
//  Created by Arvind on 23/11/20.
//

import SwiftUI

extension Color {
    
    static
    func getBGColor() -> Color {
        return Color(red: 4/255, green: 138/255, blue: 249/255)
    }
    
    static
    func getBagBGColor() -> Color {
        return Color.init(red: 241/255, green: 196/255, blue: 15/255)
    }
    
    static
    func getHomeColor() -> Color {
        return Color(UIColor(red: 0.99, green: 0.96, blue: 0.96, alpha: 1.00))
    }
    
    static
    func getColor1() -> Color {
        return Color(UIColor(red: 0.99, green: 0.46, blue: 0.42, alpha: 1.00))
    }
    
    static
    func getColor2() -> Color {
        return Color(UIColor(red: 0.00, green: 0.64, blue: 0.80, alpha: 1.00))
    }
    
    static
    func getColor3() -> Color {
        return Color(UIColor(red: 0.59, green: 0.74, blue: 0.38, alpha: 1.00))
    }
        
    static
    func GetSideMenuBGColor() -> LinearGradient {
        let colors = [Color.init(red: 0.04, green: 0.13, blue: 0.25), Color.init(red: 0.33, green: 0.47, blue: 0.58)]
        return LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
    }
}

extension UIImage {

    func getPixelColor(pos: CGPoint) -> Color {
        let pixelData = self.cgImage!.dataProvider!.data
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        
        let pixelInfo: Int = ((Int(self.size.width) * Int(pos.y)) + Int(pos.x)) * 4
        
        let r = CGFloat(data[pixelInfo]) / CGFloat(255.0)
        let g = CGFloat(data[pixelInfo+1]) / CGFloat(255.0)
        let b = CGFloat(data[pixelInfo+2]) / CGFloat(255.0)
        let a = CGFloat(data[pixelInfo+3]) / CGFloat(255.0)
        
        return Color(UIColor(red: r, green: g, blue: b, alpha: a))
    }
}
