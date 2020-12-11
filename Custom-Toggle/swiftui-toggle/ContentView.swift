
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
           // configuration.label
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
        }
        .onTapGesture {
            configuration.isOn.toggle()
        }
    }
    
    private func background(_ isOn: Bool) -> some View {
        LinearGradient(
            gradient: isOn ? darkGradient : lightGradient,
            startPoint: .top,
            endPoint: .bottom
        ).background(isOn ? Color.black : Color.yellow)
    }
    
    private var lightGradient: Gradient {
        Gradient(colors: [Color.yellow.opacity(0.3)])
    }
    
    private var darkGradient: Gradient {
        Gradient(colors: [Color.black.opacity(0.3)])
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
                center: CGPoint(x: center.x - side * 0.40, y: center.y - side * 0.30),
                radius: side * 0.4,
                startAngle: .degrees(320),
                endAngle: .degrees(108),
                clockwise: false
            )
            path.closeSubpath()
        }
        return path
    }
}
