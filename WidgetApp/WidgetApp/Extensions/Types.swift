//
//  Types.swift
//  WidgetApp
//
//  Created by Arvind on 17/11/20.
//

import Foundation
import UIKit

//MARK: - Constant

public let screenWidth = UIScreen.main.bounds.size.width
public let screenHeight = UIScreen.main.bounds.size.height

public let fontNamed = "HelveticaNeue"
public let fontNamedBold = "HelveticaNeue-Bold"

public let defaultColor = UIColor(red: 0.88, green: 0.90, blue: 0.93, alpha: 1.00)
public let groupColor = UIColor(hex: 0xEFEFF3)
public let darkColor = UIColor(hex: 0x1C1C1E)

//MARK: - Extimated Text

public func estimatedText(_ text: String, fontS: CGFloat = 13.0, width: CGFloat = CGFloat.greatestFiniteMagnitude) -> CGRect {
    let height = CGFloat.greatestFiniteMagnitude
    let size = CGSize(width: width, height: height)
    let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
    let attributes = setupAttri(fontNamedBold, size: fontS, txtColor: .black)
    return NSString(string: text).boundingRect(with: size, options: options, attributes: attributes, context: nil)
}

public func setupAttri(_ fontN: String, size: CGFloat, txtColor: UIColor) -> [NSAttributedString.Key : Any] {
    let attributes = [
        NSAttributedString.Key.font : UIFont(name: fontN, size: size)!,
        NSAttributedString.Key.foregroundColor : txtColor
    ]
    return attributes
}

//MARK: - Attributed String

public func setupTitleAttri(_ title: String,
                            txtColor: UIColor = .white,
                            fontN: String = fontNamedBold,
                            size: CGFloat = 15.0) -> NSAttributedString {
    let attributes = setupAttri(fontN, size: size, txtColor: txtColor)
    let attributed = NSMutableAttributedString(string: title, attributes: attributes)
    return attributed
}

//MARK: - UIStackView

public func createdStackView(_ views: [UIView],
                           spacing: CGFloat,
                           axis: NSLayoutConstraint.Axis,
                           distribution: UIStackView.Distribution,
                           alignment: UIStackView.Alignment) -> UIStackView {
    let sv = UIStackView(arrangedSubviews: views)
    sv.spacing = spacing
    sv.axis = axis
    sv.distribution = distribution
    sv.alignment = alignment
    return sv
}

public var kWindow: UIWindow? {
    guard let window = UIApplication.shared.keyWindow else { return nil }
    return window
}

public func delay(duration: TimeInterval, completion: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + duration, execute: completion)
}

func handleSuccessAlert(_ txt: String, imgName: String, isCircle: Bool = true, completion: (() -> ())? = nil) {
    let updateV = AlertView.alertView(kWindow!, true)
    updateV.text = NSString(string: txt)
    updateV.imgName = imgName
    updateV.isCircle = isCircle
    
    delay(duration: 1.0) {
        UIView.animate(withDuration: 0.1, animations: {
            updateV.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            updateV.alpha = 0.0
        }) { (_) in
            updateV.removeFromSuperview()
            completion?()
        }
    }
}
