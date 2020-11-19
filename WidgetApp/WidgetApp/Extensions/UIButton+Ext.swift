//
//  UIButton+Ext.swift
//  WidgetApp
//
//  Created by Arvind on 17/11/20.
//  Copyright © 2020 Arvind. All rights reserved.
//

import UIKit

extension UIButton {
    
    func configurePickerButton(_ parentV: UIView, imgNamed: String = "tray.and.arrow.down.fill", selector: Selector, controller: UIViewController) {
        frame = CGRect(x: parentV.frame.width-30.0, y: 0.0, width: 40.0, height: 40.0)
        setImage(UIImage(named: imgNamed), for: .normal)
        tintColor = .black
        addTarget(controller, action: selector, for: .touchUpInside)
        parentV.addSubview(self)
    }
    
    func configureBackBtn(_ parentV: UIView, selector: Selector, controller: UIViewController) {
        frame = CGRect(x: -15.0, y: 0.0, width: 40.0, height: 40.0)
        setImage(UIImage(named: "icon-back"), for: .normal)
        addTarget(controller, action: selector, for: .touchUpInside)
        parentV.addSubview(self)
    }
}
