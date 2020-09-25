//
//  SpringView.swift
//  SpringView
//
//  Created by Arvind on 25/09/20.
//  Copyright © 2020 Arvind rights reserved.
//

import UIKit

let AnimatedDownTime = 0.37
let AnimatedDuration = 0.18

class SpringView: UIView ,CAAnimationDelegate {
    private let textView : SimpleTextView!
    private let BallSize = CGSize.init(width: 45, height: 45)
    
    var attriString: String! {
        didSet {
            let mutableAttributedString = NSMutableAttributedString.init(string: attriString)
            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white, range: NSRange.init(location: 0, length: attriString.count))
            mutableAttributedString.addAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25)], range:NSRange.init(location: 0, length: attriString.count))
            textView.attributeString = mutableAttributedString
        }
    }
    
    var shapeLayers = [CAShapeLayer]()
    let backView  = UIView()
    
    var width:CGFloat!
    var height:CGFloat!
    override init(frame: CGRect) {
        textView = SimpleTextView(frame: CGRect.init(x: 0, y: frame.size.height-40, width: frame.size.width, height: 40))
        width = frame.size.width
        height = frame.size.height
        super.init(frame: frame)
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupBallLayers()  {
        backView.bounds = CGRect.init(origin: CGPoint.zero, size: BallSize)
        backView.center = CGPoint.init(x: 1/2.0 * width, y: 20)
        self.addSubview(backView)
       
        let pentagram = CAShapeLayer()
        let round = CAShapeLayer()
        
        // Animation Sape
        pentagram.path = pentagramPath().cgPath
        round.path = roundPath().cgPath
        
        pentagram.fillColor = UIColor.init(red: 41/255, green: 128/255, blue: 185/255, alpha: 1.0).cgColor
        round.fillColor = UIColor.init(red: 241/255, green: 196/255, blue: 15/255, alpha: 1.0).cgColor
        
        shapeLayers.append(contentsOf: [pentagram, round])
        
        shapeLayers.enums { (any, index) in
            guard let layer = any as? CAShapeLayer else{return}
            layer.frame = CGRect.init(x: 0, y: 0, width: 40, height: 40)
            backView.layer.addSublayer(layer)
        }
        switchShapLayer()
    }
  
    //MARK: - PATH
    func roundPath() ->UIBezierPath {
        let ovalPath = UIBezierPath(ovalIn: CGRect.init(x: 4, y: 4, width: 32, height: 32))
        ovalPath.apply(pathTransform)
        return ovalPath
    }
    func rectAnglePath () ->UIBezierPath {
        let rectanglePath = UIBezierPath(rect: CGRect.init(x: 4, y: 4, width: 32, height: 32))
        rectanglePath.apply(pathTransform)
        return rectanglePath
    }
    func trianglePath () -> UIBezierPath {
        let polygonPath = UIBezierPath()
        polygonPath.move(to: CGPoint(x:20,y: 0))
        polygonPath.addLine(to: CGPoint(x:37.32, y:30))
        polygonPath.addLine(to: CGPoint(x:2.68, y:30))
        polygonPath.close()
        polygonPath.apply(pathTransform)
        return polygonPath
    }
    func pentagramPath() -> UIBezierPath {
        let starPath = UIBezierPath()
        starPath.move(to: CGPoint(x:20,y: 0))
        starPath.addLine(to: CGPoint(x:27.05,y: 10.29))
        starPath.addLine(to: CGPoint(x:39.02, y:13.82))
        starPath.addLine(to: CGPoint(x:31.41, y:23.71))
        starPath.addLine(to: CGPoint(x:31.76, y:36.18))
        starPath.addLine(to: CGPoint(x:20, y:32))
        starPath.addLine(to: CGPoint(x:8.24,y: 36.18))
        starPath.addLine(to: CGPoint(x:8.59,y: 23.71))
        starPath.addLine(to: CGPoint(x:0.98, y:13.82))
        starPath.addLine(to: CGPoint(x:12.95, y:10.29))
        starPath.close()
        starPath.apply(pathTransform)
        return starPath
    }
    
    var pathTransform:CGAffineTransform{
        let scaleX =  BallSize.width / 40.0
        let scaleY =  BallSize.height / 40.0
        return CGAffineTransform.identity.scaledBy(x: scaleX, y: scaleY)
    }
    
    func setUpTextView()  {
        textView.backgroundColor = UIColor.clear
        self.addSubview(textView)
    }
    
    func setupView()  {
        setUpTextView()
        setupBallLayers()
        animate()
    }
    
    var timer :Timer?
    
    func animate()  {
        bounceBall()
        self.textView.animate()
        DispatchQueue.global().asyncAfter(deadline: .now() + AnimatedDownTime) {
            if #available(iOS 10.0, *) {
                self.timer =   Timer.scheduledTimer(withTimeInterval: (2 * AnimatedDownTime + AnimatedDuration), repeats: true) { [weak self] (timer)  in
                    self?.switchShapLayer()
                }
            } else {
                self.timer = Timer.scheduledTimer(timeInterval:(2 * AnimatedDownTime + AnimatedDuration) , target: self, selector:#selector(self.switchShapLayer), userInfo: nil, repeats: true)
            }
           
           self.timer!.fire()
            RunLoop.current.add(self.timer!, forMode: .common)
           RunLoop.current.run()
        }

    }
    
    func stopAnimtate() {
        backView.layer.removeAllAnimations()
        self.timer?.invalidate()
        textView.stopAnimate()
    }

    var currentIndex = 0
    
    @objc func switchShapLayer(){
        currentIndex = currentIndex % (shapeLayers.count == 0 ? 1 :shapeLayers.count)
        DispatchQueue.main.async {
            self.backView.layer.sublayers?.enums({ (layer, index) in
                guard let layer = layer as? CAShapeLayer else{
                    return
                }
                CATransaction.begin()
                CATransaction.setDisableActions(true)
                if index == self.currentIndex{
                    layer.opacity = 1
                }else{
                    layer.opacity = 0
                }
                CATransaction.commit()
            })
            self.currentIndex += 1
        }
    }
    
     func bounceBall()  {
     
         let period = 2*AnimatedDownTime + AnimatedDuration
         let keyAnimation = CAKeyframeAnimation(keyPath: "position.y")
         keyAnimation.values = [0,height-20 - backView.bounds.size.height / 2.0,0]
         keyAnimation.duration = AnimatedDownTime * 2
         keyAnimation.isAdditive = true
         keyAnimation.timingFunctions = [CAMediaTimingFunction.init(controlPoints: 0.6, 0.08, 0.91, 0.4),
                                         CAMediaTimingFunction.init(controlPoints: 0.08, 0.6, 0.4,0.91)]
         keyAnimation.delegate = self
         let group1 = CAAnimationGroup()
         group1.duration = period
         group1.repeatCount = Float.infinity
         group1.animations = [keyAnimation]
         backView.layer.add(group1, forKey: "drop")
         
            
         let rotateAniamtion = CAKeyframeAnimation(keyPath: "transform.rotation.z")
  
         rotateAniamtion.values = [0, Double.pi * (period / (0.9))]
         rotateAniamtion.duration = period
         rotateAniamtion.beginTime = CACurrentMediaTime() + AnimatedDownTime
         rotateAniamtion.repeatCount = Float.infinity
         rotateAniamtion.autoreverses = true
  
         backView.layer.add(rotateAniamtion, forKey: "rotate")
    }
    deinit {
        self.timer?.invalidate()
    }
}

fileprivate extension Array {
    func enums(_ block:(_ item:Any,_ index:Int)->()){
        for (i,obj) in self.enumerated() {
            block(obj,i)
        }
    }
}

fileprivate  extension UIColor {
     convenience init(rgb: (r: CGFloat, g: CGFloat, b: CGFloat)) {
        self.init(red: rgb.r/255, green: rgb.g/255, blue: rgb.b/255, alpha: 1.0)
     }
     convenience init(hsd:( H:CGFloat ,S:CGFloat,D:CGFloat)) {
        self.init(hue: hsd.H, saturation: hsd.S, brightness: hsd.D, alpha: 1.0)
     }
}
