//
//  Color.swift
//  Card-Payment
//
//  Created by Arvind on 23/11/20.
//

import SwiftUI

extension Color {
    
    static
    func getGradientColor1() -> LinearGradient {
        return LinearGradient(gradient: Gradient(colors: [Color(hex: "43cea2"), Color(hex: "185a9d")]),
                              startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
    static
    func getGradientColor2() -> LinearGradient {
        return LinearGradient(gradient: Gradient(colors: [Color(hex: "fa709a"), Color(hex: "fee140")]),
                              startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
