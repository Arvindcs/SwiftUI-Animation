//
//  UIView+Ext.swift
//  WidgetApp
//
//  Created by Arvind on 17/11/20.
//  Copyright © 2020 Arvind. All rights reserved.
//

import UIKit

let π = CGFloat.pi
let twoπ = 2*π

extension UIView {
    
    func configureContainerView(_ naviItem: UINavigationItem) {
        frame = CGRect(x: 0.0, y: 0.0, width: screenWidth-40.0, height: 40.0)
        backgroundColor = .clear
        naviItem.titleView = self
    }
    
    func configureLeftView(_ containerView: UIView) {
        frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
        backgroundColor = .blue
        containerView.addSubview(self)
    }
    
    func configureRightView(_ containerView: UIView) {
        frame = CGRect(x: containerView.frame.width-40.0, y: 0.0, width: 40.0, height: 40.0)
        backgroundColor = .yellow
        containerView.addSubview(self)
    }
    
    func configureViewForCell(_ view: UIView, _ imgView: UIImageView) -> UIView {
        let dimsBG = UIView()
        dimsBG.backgroundColor = UIColor(hex: 0x000000, alpha: 0.5)
        dimsBG.clipsToBounds = true
        view.insertSubview(dimsBG, aboveSubview: imgView)
        dimsBG.translatesAutoresizingMaskIntoConstraints = false
        return dimsBG
    }
    
    func setupShadowForView(_ parentV: UIView, cornerR: CGFloat = 8.0) {
        setupContainerView(self, cornerR: cornerR)
        parentV.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupContainerView(_ containerView: UIView, cornerR: CGFloat = 8.0) {
        containerView.backgroundColor = .white
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = cornerR
        containerView.layer.masksToBounds = false
        containerView.layer.shadowColor = UIColor.label.cgColor
        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        containerView.layer.shadowRadius = 10
        containerView.layer.shadowOpacity = 1
        containerView.layer.shouldRasterize = true
        containerView.layer.rasterizationScale = UIScreen.main.scale
    }
    
    func configureHeaderView(_ view: UIView, tableView: UITableView) -> UIView {
        let kView = UIView(frame: CGRect(x: 0.0, y: 0.0,
                                         width: view.bounds.width,
                                         height: tableView.sectionHeaderHeight))
        kView.backgroundColor = groupColor
        return kView
    }
}

//MARK: - Gradient

extension UIView {
    
    func setupGradient(width: CGFloat, startC: UIColor, endC: UIColor, animDl: CAAnimationDelegate, lineW: CGFloat = 10.0, clockwise: Bool = true) {
        let arcC = CGPoint(x: width/2, y: width/2)
        let rad: CGFloat = width/2
        let startA: CGFloat = π/2
        let endA: CGFloat = (5*π/2) * (clockwise ? 1 : -1)
        let circularP = UIBezierPath(arcCenter: arcC, radius: rad, startAngle: startA, endAngle: endA, clockwise: clockwise)
        let circleLayer = CAShapeLayer()
        circleLayer.path = circularP.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineWidth = lineW
        circleLayer.lineCap = .round
        circleLayer.strokeColor = UIColor.clear.cgColor
        
        let progressLayer = CAShapeLayer()
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = UIColor.white.cgColor
        progressLayer.path = circularP.cgPath
        progressLayer.lineWidth = lineW
        progressLayer.lineCap = .round
        progressLayer.strokeEnd = 0.0
        progressLayer.opacity = 0.2
        
        let gradientLayer = createGradientLayer(width: width, height: width, startC: startC, endC: endC)
        gradientLayer.mask = progressLayer
        
        layer.addSublayer(circleLayer)
        layer.addSublayer(gradientLayer)
        
        setupAnimGradient(animDl: animDl, progressLayer: progressLayer)
    }
    
    func setupAnimGradient(animDl: CAAnimationDelegate, progressLayer: CAShapeLayer) {
        let animStrokeEnd = CABasicAnimation(keyPath: "strokeEnd")
        animStrokeEnd.toValue = 1.0
        
        let animOpacity = CABasicAnimation(keyPath: "opacity")
        animOpacity.toValue = 1.0
        
        let animG = CAAnimationGroup()
        animG.duration = 2.0
        animG.fillMode = .forwards
        animG.isRemovedOnCompletion = false
        animG.delegate = animDl
        animG.animations = [animStrokeEnd, animOpacity]
        progressLayer.add(animG, forKey: nil)
    }
}

public func createGradientLayer(width: CGFloat, height: CGFloat, startC: UIColor, endC: UIColor) -> CAGradientLayer {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = CGRect(x: 0.0, y: 0.0, width: width, height: height)
    gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
    gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
    gradientLayer.colors = [startC.cgColor, endC.cgColor]
    return gradientLayer
}

extension CGFloat {
    
    func degreesToRadians() -> CGFloat {
        return self * π / 180.0
    }
    
    func radiansToDegrees() -> CGFloat {
        return self * 180.0 / π
    }
    
    static func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / Float(0xFFFFFFFF))
    }
    
    static func random(min: CGFloat, max: CGFloat) -> CGFloat {
        assert(min < max)
        return CGFloat.random() * (max - min) + min
    }
}
