//
//  SmartWatchView.swift
//  Download
//
//  Created by Arvind on 03/02/21.
// //292A30

import UIKit

class SmartWatchView: UIView {
    
    var watchPath = UIBezierPath()
    var shapeLayer = CAShapeLayer()
    
    override func draw(_ rect: CGRect) {
        bezierDrawing1()
        bezierDrawing2()
        bezierDrawing3()
        bezierDrawing4()
        bezierDrawing5()
        bezierDrawing6()
        bezierDrawing7()
        bezierDrawing8()
        addAnimation()
    }
    
    func addAnimation() {
        
        shapeLayer.path = watchPath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 5.0
        
        layer.addSublayer(shapeLayer)
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 10
        shapeLayer.add(animation, forKey: "line")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.2) {
            let darkGreen = UIColor(red: 137/255, green: 192/255, blue: 180/255, alpha: 1).cgColor
            self.shapeLayer.lineWidth = 1.0
            self.shapeLayer.strokeColor = UIColor.white.cgColor
            self.shapeLayer.fillColor = darkGreen
        }
    }
    
    func bezierDrawing1() {
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 326.76, y: 312))
        bezierPath.addLine(to: CGPoint(x: 316.8, y: 312))
        bezierPath.addLine(to: CGPoint(x: 316.8, y: 253.77))
        bezierPath.addCurve(to: CGPoint(x: 282.12, y: 222), controlPoint1: CGPoint(x: 316.8, y: 236.25), controlPoint2: CGPoint(x: 301.24, y: 222))
        bezierPath.addLine(to: CGPoint(x: 281.29, y: 222))
        bezierPath.addLine(to: CGPoint(x: 276.81, y: 214.84))
        bezierPath.addCurve(to: CGPoint(x: 270.38, y: 193.16), controlPoint1: CGPoint(x: 272.6, y: 208.13), controlPoint2: CGPoint(x: 270.38, y: 200.63))
        bezierPath.addCurve(to: CGPoint(x: 232.31, y: 162), controlPoint1: CGPoint(x: 270.38, y: 175.98), controlPoint2: CGPoint(x: 253.3, y: 162))
        bezierPath.addLine(to: CGPoint(x: 165.49, y: 162))
        bezierPath.addCurve(to: CGPoint(x: 127.41, y: 193.16), controlPoint1: CGPoint(x: 144.5, y: 162), controlPoint2: CGPoint(x: 127.41, y: 175.98))
        bezierPath.addCurve(to: CGPoint(x: 120.99, y: 214.84), controlPoint1: CGPoint(x: 127.41, y: 200.63), controlPoint2: CGPoint(x: 125.19, y: 208.12))
        bezierPath.addLine(to: CGPoint(x: 116.51, y: 222))
        bezierPath.addLine(to: CGPoint(x: 115.68, y: 222))
        bezierPath.addCurve(to: CGPoint(x: 81, y: 253.77), controlPoint1: CGPoint(x: 96.56, y: 222), controlPoint2: CGPoint(x: 81, y: 236.25))
        bezierPath.addLine(to: CGPoint(x: 81, y: 430.24))
        bezierPath.addCurve(to: CGPoint(x: 115.68, y: 462), controlPoint1: CGPoint(x: 81, y: 447.75), controlPoint2: CGPoint(x: 96.56, y: 462))
        bezierPath.addLine(to: CGPoint(x: 116.51, y: 462))
        bezierPath.addLine(to: CGPoint(x: 120.99, y: 469.16))
        bezierPath.addCurve(to: CGPoint(x: 127.42, y: 490.84), controlPoint1: CGPoint(x: 125.2, y: 475.88), controlPoint2: CGPoint(x: 127.42, y: 483.37))
        bezierPath.addCurve(to: CGPoint(x: 165.5, y: 522), controlPoint1: CGPoint(x: 127.42, y: 508.02), controlPoint2: CGPoint(x: 144.5, y: 522))
        bezierPath.addLine(to: CGPoint(x: 232.31, y: 522))
        bezierPath.addCurve(to: CGPoint(x: 270.39, y: 490.84), controlPoint1: CGPoint(x: 253.3, y: 522), controlPoint2: CGPoint(x: 270.39, y: 508.02))
        bezierPath.addCurve(to: CGPoint(x: 276.81, y: 469.16), controlPoint1: CGPoint(x: 270.39, y: 483.37), controlPoint2: CGPoint(x: 272.61, y: 475.88))
        bezierPath.addLine(to: CGPoint(x: 281.29, y: 462))
        bezierPath.addLine(to: CGPoint(x: 282.12, y: 462))
        bezierPath.addCurve(to: CGPoint(x: 316.8, y: 430.24), controlPoint1: CGPoint(x: 301.24, y: 462), controlPoint2: CGPoint(x: 316.8, y: 447.75))
        bezierPath.addLine(to: CGPoint(x: 316.8, y: 372))
        bezierPath.addLine(to: CGPoint(x: 326.76, y: 372))
        bezierPath.addCurve(to: CGPoint(x: 343, y: 357.13), controlPoint1: CGPoint(x: 335.72, y: 372), controlPoint2: CGPoint(x: 343, y: 365.33))
        bezierPath.addLine(to: CGPoint(x: 343, y: 326.87))
        bezierPath.addCurve(to: CGPoint(x: 326.76, y: 312), controlPoint1: CGPoint(x: 343, y: 318.67), controlPoint2: CGPoint(x: 335.72, y: 312))
        
        bezierPath.move(to: CGPoint(x: 303.7, y: 430.24))
        bezierPath.addCurve(to: CGPoint(x: 282.12, y: 450), controlPoint1: CGPoint(x: 303.7, y: 441.14), controlPoint2: CGPoint(x: 294.02, y: 450))
        bezierPath.addLine(to: CGPoint(x: 115.68, y: 450))
        bezierPath.addCurve(to: CGPoint(x: 94.1, y: 430.24), controlPoint1: CGPoint(x: 103.78, y: 450), controlPoint2: CGPoint(x: 94.1, y: 441.14))
        bezierPath.addLine(to: CGPoint(x: 94.1, y: 253.77))
        bezierPath.addCurve(to: CGPoint(x: 115.68, y: 234), controlPoint1: CGPoint(x: 94.1, y: 242.87), controlPoint2: CGPoint(x: 103.78, y: 234))
        bezierPath.addLine(to: CGPoint(x: 282.12, y: 234))
        bezierPath.addCurve(to: CGPoint(x: 303.7, y: 253.77), controlPoint1: CGPoint(x: 294.02, y: 234), controlPoint2: CGPoint(x: 303.7, y: 242.87))
        bezierPath.addLine(to: CGPoint(x: 303.7, y: 312))
        bezierPath.addLine(to: CGPoint(x: 303.7, y: 372))
        bezierPath.addLine(to: CGPoint(x: 303.7, y: 430.24))
        
        bezierPath.close()
        UIColor.clear.setFill()
        bezierPath.fill()
        watchPath.append(bezierPath)
    }
    
    func bezierDrawing2() {
        
        let bezier2Path = UIBezierPath()
        bezier2Path.move(to: CGPoint(x: 120.3, y: 288))
        bezier2Path.addCurve(to: CGPoint(x: 124.93, y: 286.24), controlPoint1: CGPoint(x: 121.98, y: 288), controlPoint2: CGPoint(x: 123.65, y: 287.41))
        bezier2Path.addLine(to: CGPoint(x: 151.13, y: 262.24))
        bezier2Path.addCurve(to: CGPoint(x: 151.13, y: 253.76), controlPoint1: CGPoint(x: 153.69, y: 259.9), controlPoint2: CGPoint(x: 153.69, y: 256.11))
        bezier2Path.addCurve(to: CGPoint(x: 141.87, y: 253.76), controlPoint1: CGPoint(x: 148.57, y: 251.41), controlPoint2: CGPoint(x: 144.43, y: 251.41))
        bezier2Path.addLine(to: CGPoint(x: 115.67, y: 277.76))
        bezier2Path.addCurve(to: CGPoint(x: 115.67, y: 286.24), controlPoint1: CGPoint(x: 113.11, y: 280.11), controlPoint2: CGPoint(x: 113.11, y: 283.9))
        bezier2Path.addCurve(to: CGPoint(x: 120.3, y: 288), controlPoint1: CGPoint(x: 116.95, y: 287.41), controlPoint2: CGPoint(x: 118.62, y: 288))
        bezier2Path.close()
        watchPath.append(bezier2Path)
    }
    
    func bezierDrawing3() {
        let bezier3Path = UIBezierPath()
        bezier3Path.move(to: CGPoint(x: 120.3, y: 318))
        bezier3Path.addCurve(to: CGPoint(x: 124.93, y: 316.24), controlPoint1: CGPoint(x: 121.98, y: 318), controlPoint2: CGPoint(x: 123.65, y: 317.41))
        bezier3Path.addLine(to: CGPoint(x: 138.03, y: 304.24))
        bezier3Path.addCurve(to: CGPoint(x: 138.03, y: 295.76), controlPoint1: CGPoint(x: 140.59, y: 301.9), controlPoint2: CGPoint(x: 140.59, y: 298.11))
        bezier3Path.addCurve(to: CGPoint(x: 128.77, y: 295.76), controlPoint1: CGPoint(x: 135.47, y: 293.41), controlPoint2: CGPoint(x: 131.33, y: 293.41))
        bezier3Path.addLine(to: CGPoint(x: 115.67, y: 307.76))
        bezier3Path.addCurve(to: CGPoint(x: 115.67, y: 316.24), controlPoint1: CGPoint(x: 113.11, y: 310.11), controlPoint2: CGPoint(x: 113.11, y: 313.9))
        bezier3Path.addCurve(to: CGPoint(x: 120.3, y: 318), controlPoint1: CGPoint(x: 116.95, y: 317.41), controlPoint2: CGPoint(x: 118.62, y: 318))
        bezier3Path.close()
        
        watchPath.append(bezier3Path)
    }
    
    func bezierDrawing4() {
        let bezier4Path = UIBezierPath()
        bezier4Path.move(to: CGPoint(x: 141.85, y: 283.74))
        bezier4Path.addCurve(to: CGPoint(x: 139.95, y: 288), controlPoint1: CGPoint(x: 140.66, y: 284.88), controlPoint2: CGPoint(x: 139.95, y: 286.38))
        bezier4Path.addCurve(to: CGPoint(x: 141.85, y: 292.2), controlPoint1: CGPoint(x: 139.95, y: 289.62), controlPoint2: CGPoint(x: 140.66, y: 291.12))
        bezier4Path.addCurve(to: CGPoint(x: 146.5, y: 294), controlPoint1: CGPoint(x: 143.09, y: 293.34), controlPoint2: CGPoint(x: 144.72, y: 294))
        bezier4Path.addCurve(to: CGPoint(x: 151.15, y: 292.26), controlPoint1: CGPoint(x: 148.27, y: 294), controlPoint2: CGPoint(x: 149.91, y: 293.34))
        bezier4Path.addCurve(to: CGPoint(x: 153.05, y: 288), controlPoint1: CGPoint(x: 152.33, y: 291.12), controlPoint2: CGPoint(x: 153.05, y: 289.56))
        bezier4Path.addCurve(to: CGPoint(x: 151.15, y: 283.74), controlPoint1: CGPoint(x: 153.05, y: 286.44), controlPoint2: CGPoint(x: 152.33, y: 284.88))
        bezier4Path.addCurve(to: CGPoint(x: 141.85, y: 283.74), controlPoint1: CGPoint(x: 148.66, y: 281.52), controlPoint2: CGPoint(x: 144.27, y: 281.52))
        bezier4Path.close()
        watchPath.append(bezier4Path)
    }
    
    func bezierDrawing5() {
        
        let bezier5Path = UIBezierPath()
        bezier5Path.move(to: CGPoint(x: 154.97, y: 280.24))
        bezier5Path.addCurve(to: CGPoint(x: 159.6, y: 282), controlPoint1: CGPoint(x: 156.25, y: 281.41), controlPoint2: CGPoint(x: 157.92, y: 282))
        bezier5Path.addCurve(to: CGPoint(x: 164.23, y: 280.24), controlPoint1: CGPoint(x: 161.28, y: 282), controlPoint2: CGPoint(x: 162.95, y: 281.41))
        bezier5Path.addLine(to: CGPoint(x: 183.88, y: 262.24))
        bezier5Path.addCurve(to: CGPoint(x: 183.88, y: 253.76), controlPoint1: CGPoint(x: 186.44, y: 259.9), controlPoint2: CGPoint(x: 186.44, y: 256.11))
        bezier5Path.addCurve(to: CGPoint(x: 174.62, y: 253.76), controlPoint1: CGPoint(x: 181.32, y: 251.41), controlPoint2: CGPoint(x: 177.18, y: 251.41))
        bezier5Path.addLine(to: CGPoint(x: 154.97, y: 271.76))
        bezier5Path.addCurve(to: CGPoint(x: 154.97, y: 280.24), controlPoint1: CGPoint(x: 152.41, y: 274.11), controlPoint2: CGPoint(x: 152.41, y: 277.9))
        bezier5Path.close()
        watchPath.append(bezier5Path)
    }
    
    func bezierDrawing6() {
        
        let bezier6Path = UIBezierPath()
        bezier6Path.move(to: CGPoint(x: 174.62, y: 283.76))
        bezier6Path.addLine(to: CGPoint(x: 115.67, y: 337.76))
        bezier6Path.addCurve(to: CGPoint(x: 115.67, y: 346.24), controlPoint1: CGPoint(x: 113.11, y: 340.11), controlPoint2: CGPoint(x: 113.11, y: 343.9))
        bezier6Path.addCurve(to: CGPoint(x: 120.3, y: 348), controlPoint1: CGPoint(x: 116.95, y: 347.41), controlPoint2: CGPoint(x: 118.62, y: 348))
        bezier6Path.addCurve(to: CGPoint(x: 124.93, y: 346.24), controlPoint1: CGPoint(x: 121.98, y: 348), controlPoint2: CGPoint(x: 123.65, y: 347.41))
        bezier6Path.addLine(to: CGPoint(x: 183.88, y: 292.24))
        bezier6Path.addCurve(to: CGPoint(x: 183.88, y: 283.76), controlPoint1: CGPoint(x: 186.44, y: 289.9), controlPoint2: CGPoint(x: 186.44, y: 286.11))
        bezier6Path.addCurve(to: CGPoint(x: 174.62, y: 283.76), controlPoint1: CGPoint(x: 181.32, y: 281.41), controlPoint2: CGPoint(x: 177.18, y: 281.41))
        bezier6Path.close()
        watchPath.append(bezier6Path)
    }
    
    func bezierDrawing7() {
        let bezier7Path = UIBezierPath()
        bezier7Path.move(to: CGPoint(x: 187.77, y: 271.74))
        bezier7Path.addCurve(to: CGPoint(x: 185.8, y: 276), controlPoint1: CGPoint(x: 186.51, y: 272.82), controlPoint2: CGPoint(x: 185.8, y: 274.38))
        bezier7Path.addCurve(to: CGPoint(x: 187.7, y: 280.26), controlPoint1: CGPoint(x: 185.8, y: 277.62), controlPoint2: CGPoint(x: 186.51, y: 279.12))
        bezier7Path.addCurve(to: CGPoint(x: 192.35, y: 282), controlPoint1: CGPoint(x: 188.94, y: 281.34), controlPoint2: CGPoint(x: 190.65, y: 282))
        bezier7Path.addCurve(to: CGPoint(x: 197, y: 280.26), controlPoint1: CGPoint(x: 194.05, y: 282), controlPoint2: CGPoint(x: 195.76, y: 281.34))
        bezier7Path.addCurve(to: CGPoint(x: 198.9, y: 276), controlPoint1: CGPoint(x: 198.18, y: 279.12), controlPoint2: CGPoint(x: 198.9, y: 277.56))
        bezier7Path.addCurve(to: CGPoint(x: 197, y: 271.74), controlPoint1: CGPoint(x: 198.9, y: 274.44), controlPoint2: CGPoint(x: 198.18, y: 272.88))
        bezier7Path.addCurve(to: CGPoint(x: 187.77, y: 271.74), controlPoint1: CGPoint(x: 194.51, y: 269.52), controlPoint2: CGPoint(x: 190.12, y: 269.52))
        bezier7Path.close()
        watchPath.append(bezier7Path)
    }
    
    func bezierDrawing8() {
        let bezier8Path = UIBezierPath()
        bezier8Path.move(to: CGPoint(x: 207.37, y: 253.76))
        bezier8Path.addLine(to: CGPoint(x: 200.82, y: 259.76))
        bezier8Path.addCurve(to: CGPoint(x: 200.82, y: 268.24), controlPoint1: CGPoint(x: 198.26, y: 262.11), controlPoint2: CGPoint(x: 198.26, y: 265.9))
        bezier8Path.addCurve(to: CGPoint(x: 205.45, y: 270), controlPoint1: CGPoint(x: 202.1, y: 269.41), controlPoint2: CGPoint(x: 203.77, y: 270))
        bezier8Path.addCurve(to: CGPoint(x: 210.08, y: 268.24), controlPoint1: CGPoint(x: 207.13, y: 270), controlPoint2: CGPoint(x: 208.8, y: 269.41))
        bezier8Path.addLine(to: CGPoint(x: 216.63, y: 262.24))
        bezier8Path.addCurve(to: CGPoint(x: 216.63, y: 253.76), controlPoint1: CGPoint(x: 219.19, y: 259.9), controlPoint2: CGPoint(x: 219.19, y: 256.11))
        bezier8Path.addCurve(to: CGPoint(x: 207.37, y: 253.76), controlPoint1: CGPoint(x: 214.07, y: 251.41), controlPoint2: CGPoint(x: 209.93, y: 251.41))
        watchPath.append(bezier8Path)
    }
}
