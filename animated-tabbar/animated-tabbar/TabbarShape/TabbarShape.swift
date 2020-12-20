//
//  TabbarShape.swift
//  animated-tabbar
//
//  Created by Arvind on 20/12/20.
//

import SwiftUI

struct CustomShape : Shape {
    
    var xOffSet : CGFloat
    
    func path(in rect: CGRect) -> Path {
       
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        
        let center = xOffSet - 3
        path.move(to: CGPoint(x: center-50, y: 0))
        
        let value1: CGFloat = 25
        let value2: CGFloat = 35
      
        let pt1_1 = CGPoint(x: center - value1, y: 0.0)
        let pt2_1 = CGPoint(x: center - value1, y: value2)
        path.addCurve(to:  CGPoint(x: center, y: value2), controlPoint1: pt1_1, controlPoint2: pt2_1)
        
        let pt1_2 = CGPoint(x: center + value1, y: value2)
        let pt2_2 = CGPoint(x: center + value1, y: 0)
        path.addCurve(to: CGPoint(x: center + 50, y: 0), controlPoint1: pt1_2, controlPoint2: pt2_2)
        
        return Path(path.cgPath)

    }
}

