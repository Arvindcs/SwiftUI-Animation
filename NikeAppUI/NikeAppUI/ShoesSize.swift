//
//  ShoesSize.swift
//  NikeAppUI

import SwiftUI

var sizes = [6, 7, 8, 9, 10]
var productImgList = ["1", "2", "3", "4"]

struct SizeButton: View {
    
    @Binding var size: Int
    var title: Int
    
    var body: some View {
        
        Button(action: {size = title}) {
            
            Text("\(title)")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(size == title ? .white : Color.black.opacity(0.7))
                .frame(width: 35, height: 35)
                .background(size == title ? Color("red") : Color.white)
                .cornerRadius(10)
        }
    }
}

struct ColorButton: View {
    
    @Binding var index: Int
    
    var body: some View {
        
        HStack(spacing: 12){
            
            Button(action: {
                
                index = 0
                
            }) {
                
                Circle()
                    .fill(Color(UIColor.AppColors.blue))
                    .frame(width: index == 0 ? 30 : 20, height: index == 0 ? 30 : 20)
            }
            
            Button(action: {
                
                index = 1
                
            }) {
                
                Circle()
                    .fill(Color.black)
                    .frame(width: index == 1 ? 30 : 20, height: index == 1 ? 30 : 20)
            }
            
            Button(action: {
                
                index = 2
                
            }) {
                
                Circle()
                    .fill(Color(UIColor.AppColors.silver))
                    .frame(width: index == 2 ? 30 : 20, height: index == 2 ? 30 : 20)
            }
        }
        .padding(.top,10)
    }
}

extension UIColor {
    struct AppColors {
        static let blue = UIColor(hexString: "#2596be")
        static let silver = UIColor(hexString: "#dadbe0")
    }
    
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
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
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
