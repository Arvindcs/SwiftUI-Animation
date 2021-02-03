//
//  SplashShape.swift
//  ColorChanges
//
//  Created by Arvind on 01/02/21.
//


import SwiftUI

struct SplashShape: Shape {

    var progress: CGFloat
    
    var animatableData: CGFloat {
        get { return progress }
        set { self.progress = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        return circle(rect: rect)
    }
  
    func circle(rect: CGRect) -> Path {
        
        let a: CGFloat = rect.height / 2.0
        let b: CGFloat = rect.width / 2.0
        
        let c = pow(pow(a, 2) + pow(b, 2), 0.5) // a^2 + b^2 = c^2  --> Solved for 'c'
        
        let radius = c * progress
        // Build Circle Path
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: radius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 360), clockwise: true)
        return path
        
    }
}
