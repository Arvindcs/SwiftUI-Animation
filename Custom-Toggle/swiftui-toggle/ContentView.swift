
//
//  ContentView.swift
//  swiftui-demo
//
//  Created by Arvind on 09/08/20.
//  Copyright © 2020 Arvind. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var isOn: Bool = false
    
    var body: some View {
        
        VStack {
            
            Toggle(isOn: $isOn, label: label)
                .toggleStyle(SunMoonToggleStyle())
            if isOn {
                Color.black.ignoresSafeArea()
            } else {
                Color.yellow.ignoresSafeArea()
            }
        }
        .padding()
    }
    
    func label() -> Text {
        if isOn {
            return Text("Moon").font(.system(size: 20))
        } else {
            return Text("SunRise").font(.system(size: 20))
        }
    }
}

public struct SunMoonToggleStyle: ToggleStyle {
    
    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            ZStack {
                ZStack {
                    Circle()
                        .opacity(configuration.isOn ? 0.0 : 1.0)
                    Moon()
                        .opacity(configuration.isOn ? 1.0 : 0.0)
                }
                .foregroundColor(Color.white)
                .offset(x: configuration.isOn ? 10 : -10)
                .frame(width: 40.0, height: 30)
                .shadow(color: Color.black.opacity(0.1), radius: 3, x: configuration.isOn ? -2 : 2, y: 1)
            }
            .frame(width: 57, height: 35)
            .background(background(configuration.isOn))
            .clipShape(Capsule())
            .offset(x: 2)
            .animation(Animation.spring(response: 0.3, dampingFraction: 0.7, blendDuration: 0))
        }   .onTapGesture {
            configuration.isOn.toggle()
        }
    }
    
    private func background(_ isOn: Bool) -> some View {
        LinearGradient(
            gradient: isOn ? darkGradient : lightGradient,
            startPoint: .top,
            endPoint: .bottom
        ).background(isOn ? Color.black : Color.black)
    }
    
    private var lightGradient: Gradient {
        Gradient(colors: [Color.blue.opacity(0.3), Color.blue.opacity(0.5), Color.blue.opacity(0.3)])
    }
    
    private var darkGradient: Gradient {
        Gradient(colors: [Color.blue.opacity(0.3), Color.blue.opacity(0.5), Color.blue.opacity(0.3)])
    }
}

@frozen public struct Moon: Shape {
    
    public func path(in rect: CGRect) -> Path {
        
        let side = min(rect.width, rect.height)
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        let path = Path { path in
            path.addArc(
                center: center,
                radius: side * 0.5,
                startAngle: .degrees(165.5),
                endAngle: .degrees(265.5),
                clockwise: true
            )
            path.addArc(
                center: CGPoint(x: center.x - side * 0.35, y: center.y - side * 0.25),
                radius: side * 0.4,
                startAngle: .degrees(321.5),
                endAngle: .degrees(109.5),
                clockwise: false
            )
            path.closeSubpath()
        }
        return path
    }
}

extension Color {
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
