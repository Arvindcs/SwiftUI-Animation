//
//  ContentView.swift
//  loadingDotAnimation
//
//  Created by Arvind on 3/2/20.
//  Copyright © 2020 Arvind. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showAnimation = false
    var heightAndWidth: CGFloat = 25
    
    var body: some View {
        ZStack {
            Color.getBGColor().ignoresSafeArea()
            HStack {
                Circle()
                    .fill(Color.getBallColor())
                    .frame(width: heightAndWidth, height: heightAndWidth)
                    .offset(x: 0, y: showAnimation ? 0 : -50)
                    .animation(Animation
                    .interpolatingSpring(stiffness: 100, damping: 5)
                    .repeatForever(autoreverses: false).delay(0.02))
                Circle()
                    .fill(Color.getBallColor())
                    .frame(width: heightAndWidth, height: heightAndWidth)
                    .offset(x: 0, y: showAnimation ? 0 : -50)
                    .animation(Animation
                    .interpolatingSpring(stiffness: 100, damping: 5)
                   .repeatForever(autoreverses: false).delay(0.04))
                Circle()
                    .fill(Color.getBallColor())
                    .frame(width: heightAndWidth, height: heightAndWidth)
                    .offset(x: 0, y: showAnimation ? 0 : -50)
                    .animation(Animation
                    .interpolatingSpring(stiffness: 100, damping: 5)
                    .repeatForever(autoreverses: false).delay(0.06))
                }.onAppear() {
                self.showAnimation.toggle()
            }
            VStack {
                Image("profile")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .center)
                Text("codewithArvind").foregroundColor(.black).font(.headline)
            }.offset(y: 380)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    
    static
    func getBGColor() -> Color {
        return Color(red: 224/255, green: 229/255, blue: 236/255)
    }
    
    static
    func getBallColor() -> LinearGradient {
        let color = [
            Color(hex: "f35872"),
            Color(hex: "f99068"),
        ]
        return LinearGradient(gradient: Gradient(colors: color), startPoint: .leading, endPoint: .trailing)
    }
    
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
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

