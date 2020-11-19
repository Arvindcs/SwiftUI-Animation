//
//  UIImageView+Ext.swift
//  WidgetApp
//
//  Created by Arvind on 17/11/20.
//  Copyright © 2020 Arvind. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func configureIMGViewForCell(_ contentView: UIView, imgName: String, ctMore: UIView.ContentMode = .scaleAspectFill) {
        contentMode = ctMore
        clipsToBounds = true
        image = UIImage(named: imgName)?.withRenderingMode(.alwaysTemplate)
        tintColor = .black
        contentView.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
