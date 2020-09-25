//
//  AppDelegate.swift
//  ViewController
//
//  Created by Arvind on 25/09/20.
//  Copyright © 2020 Arvind rights reserved.
//


import UIKit

class AnimatedVC: UIViewController {
    
    //MARK: Variables
    var timer: Timer? = nil
    let TextList = ["Arvind", "Please Wait", "Arvind", "Please Wait"]
    var animateView :SpringView!
    
    override func viewDidLoad() {
        intializeUI()
    }
    
    // MARK:- intializeUI UI
    
    func intializeUI() {
   
        animateView = SpringView(frame: CGRect.init(x: 0, y: view.bounds.size.height/2 - 150, width: view.bounds.size.width, height: 130))
        animateView.attriString = "CodeWithArvind"
        view.addSubview(animateView)
        timer = Timer.scheduledTimer(timeInterval:  0.18, target: self, selector: #selector(didChangeText), userInfo: nil, repeats: true)
    }
    
    @objc
    func didChangeText() {
        let index = Int(arc4random()%(UInt32((TextList.count))))
        self.animateView.attriString = TextList[index]
    }
}

