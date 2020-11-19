//
//  AlertView.swift
//  WidgetApp
//  let alertView = AlertView(frame: CGRect(x: (kWindow?.frame.midX)!, y: (kWindow?.frame.midY)!, width: 150, height: 150))
//  Created by Arvind on 19/11/20.
//

import UIKit

class AlertView: UIView {
    
    var text: NSString = ""
    var imgName = ""
    var isCircle = true
    
    class func alertView(_ view: UIView, _ animate: Bool) -> AlertView {
        let alertView = AlertView(frame: view.bounds)
        alertView.backgroundColor = UIColor.init(red: 220/255, green: 220/255, blue: 220/255, alpha: 0.4)
        alertView.isOpaque = false
        alertView.isUserInteractionEnabled = true
        view.addSubview(alertView)
        alertView.showAnimate(animate)
        return alertView
    }
    
    override func draw(_ rect: CGRect) {
        let circleH: CGFloat = 96
        if isCircle {
            let circleL = CAShapeLayer()
            let circleR = CGRect(x: bounds.midX - circleH/2,
                                 y: bounds.midY - circleH/2,
                                 width: circleH, height: circleH)
            circleL.path = UIBezierPath(ovalIn: circleR).cgPath
            circleL.lineWidth = 5.0
            circleL.strokeColor = UIColor.white.cgColor
            circleL.fillColor = UIColor.clear.cgColor
            layer.addSublayer(circleL)
        }
        
        if let checkmarkIMG = UIImage(named: imgName) {
            let width = checkmarkIMG.size.width
            let height = checkmarkIMG.size.height
            let x = center.x - (width/2)
            let y = center.y - (height/2)
            let point = CGPoint(x: x, y: y)
            checkmarkIMG.draw(at: point)
        }
        
        let attributes = setupAttri(fontNamedBold, size: 17.0, txtColor: .white)
        let textSize = text.size(withAttributes: attributes)
        let textRect = CGRect(x: center.x - round(textSize.width/2),
                              y: center.y - round(textSize.height/2) + circleH/2 + 20,
                              width: textSize.width, height: textSize.height)
        text.draw(in: textRect, withAttributes: attributes)
    }
    
    func showAnimate(_ animate: Bool) {
        alpha = 0.0
        transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        UIView.animate(withDuration: 0.33) {
            self.alpha = 1.0
            self.transform = .identity
        }
    }
}
