//
//  UITextField+Ext.swift
//  WidgetApp
//
//  Created by Arvind on 17/11/20.
//  Copyright © 2020 Arvind. All rights reserved.
//

import UIKit

extension UITextField {
    
    func configureTF(_ controller: UIViewController, _ parentV: UIView, xPos: CGFloat, width: CGFloat, dl: UITextFieldDelegate) {
        let txt = NSLocalizedString("Search", comment: "UITextField+Ext.swift: Search")
        let attributes = [NSAttributedString.Key.foregroundColor : UIColor.gray]
        let attributedP = NSMutableAttributedString(string: txt, attributes: attributes)
        
        let imgView = UIImageView(image: UIImage(named: "icon-search")?.withRenderingMode(.alwaysTemplate))
        imgView.frame.origin = CGPoint(x: 5.0, y: 0.0)
        
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 27.0, height: 22.0))
        view.backgroundColor = .clear
        view.addSubview(imgView)
        
        frame = CGRect(x: xPos, y: 2.0, width: width, height: 36.0)
        tintColor = .gray
        delegate = dl
        setupTF(view, attributedP)
        layer.cornerRadius = 10.0
        parentV.addSubview(self)
    }
    
    func configureFromTF(_ placeholderTxt: String, imgName: String) {
        let attributes = [NSAttributedString.Key.foregroundColor : UIColor.gray]
        let attributedP = NSMutableAttributedString(string: placeholderTxt, attributes: attributes)
        
        let img = UIImage(named: imgName)?.withRenderingMode(.alwaysTemplate)
        let imgView = UIImageView(image: img)
        let size = CGSize(width: 30.0, height: 30.0)
        let point = CGPoint(x: 5.0, y: 0.0)
        imgView.tintColor = defaultColor
        imgView.frame = CGRect(origin: point, size: size)
        
        let separatorP = CGPoint(x: 39.0, y: 5.0)
        let separatorS = CGSize(width: 1.0, height: 20.0)
        let separatorView = UIView(frame: CGRect(origin: separatorP, size: separatorS))
        separatorView.backgroundColor = .gray
        
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 45.0, height: 30.0))
        view.backgroundColor = .clear
        view.addSubview(imgView)
        view.addSubview(separatorView)
        
        font = UIFont(name: fontNamed, size: 17.0)
        setupTF(view, attributedP)
        layer.cornerRadius = 50/2
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.lightGray.cgColor
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: screenWidth*0.9).isActive = true
        heightAnchor.constraint(equalToConstant: 50.0).isActive = true
    }
    
    func configureFromTFLeftRightView(_ placeholderTxt: String, imgName: String, rightImgView: UIImageView) {
        configureFromTF(placeholderTxt, imgName: imgName)
        
        let size = CGSize(width: 30.0, height: 30.0)
        let rightPoint = CGPoint(x: -5.0, y: 0.0)
        rightImgView.image = UIImage(named: "icon-eyeOff")
        rightImgView.isUserInteractionEnabled = true
        rightImgView.frame = CGRect(origin: rightPoint, size: size)
        
        let rView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 45.0, height: 30.0))
        rView.backgroundColor = .clear
        rView.addSubview(rightImgView)
        rightView = rView
        rightViewMode = .always
    }
    
    private func setupTF(_ view: UIView, _ attributedP: NSMutableAttributedString) {
        backgroundColor = .white
        leftViewMode = .always
        leftView = view
        attributedPlaceholder = attributedP
        clipsToBounds = true
    }
}
