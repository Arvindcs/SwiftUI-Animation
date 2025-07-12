//
//  Color+Extensions.swift
//  SideMenu-SwiftUI
//
//  Created by Arvind on 23/11/20.
//

import SwiftUI

// MARK: - Color Extensions

extension Color {
    // MARK: - App Theme Colors
    
    /// Primary background color for the app
    static var primaryBackgroundColor: Color {
        Color(red: 4/255, green: 138/255, blue: 249/255)
    }
    
    /// Background color for bag-related UI elements
    static var bagBackgroundColor: Color {
        Color(red: 241/255, green: 196/255, blue: 15/255)
    }
    
    /// Background color for the home menu item
    static var homeColor: Color {
        Color(UIColor(red: 0.99, green: 0.96, blue: 0.96, alpha: 1.00))
    }
    
    /// Background color for the orders menu item
    static var ordersColor: Color {
        Color(UIColor(red: 0.99, green: 0.46, blue: 0.42, alpha: 1.00))
    }
    
    /// Background color for the wishlist menu item
    static var wishlistColor: Color {
        Color(UIColor(red: 0.00, green: 0.64, blue: 0.80, alpha: 1.00))
    }
    
    /// Background color for the about menu item
    static var aboutColor: Color {
        Color(UIColor(red: 0.59, green: 0.74, blue: 0.38, alpha: 1.00))
    }
    
    /// Gradient background for the side menu
    static var sideMenuBackgroundGradient: LinearGradient {
        let colors = [
            Color(red: 0.04, green: 0.13, blue: 0.25),
            Color(red: 0.33, green: 0.47, blue: 0.58)
        ]
        return LinearGradient(
            gradient: Gradient(colors: colors),
            startPoint: .top,
            endPoint: .bottom
        )
    }
    
    // MARK: - Legacy Method Support (Deprecated)
    
    @available(*, deprecated, message: "Use homeColor instead")
    static func getHomeColor() -> Color {
        return homeColor
    }
    
    @available(*, deprecated, message: "Use ordersColor instead")
    static func getColor1() -> Color {
        return ordersColor
    }
    
    @available(*, deprecated, message: "Use wishlistColor instead")
    static func getColor2() -> Color {
        return wishlistColor
    }
    
    @available(*, deprecated, message: "Use aboutColor instead")
    static func getColor3() -> Color {
        return aboutColor
    }
    
    @available(*, deprecated, message: "Use sideMenuBackgroundGradient instead")
    static func GetSideMenuBGColor() -> LinearGradient {
        return sideMenuBackgroundGradient
    }
}
