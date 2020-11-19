//
//  WidgetAppCell.swift
//  WidgetApp
//
//  Created by Arvind on 17/11/20.
//

import UIKit


class WidgetAppCell: UICollectionViewCell {
    
    //MARK: - Properties
    static let identifier = "WidgetAppCell"
    let imgView = UIImageView()
    let nameLbl = UILabel()
    let originalPrLbl = UILabel()
    let favoriteBtn = UIButton()
    let containerView = UIView()

    //MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        layer.opacity = 0.8
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        layer.opacity = 1.0
        super.touchesEnded(touches, with: event)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        layer.opacity = 1.0
        super.touchesCancelled(touches, with: event)
    }
}

//MARK: - Configures

extension WidgetAppCell {
    
    func configureCell() {
        backgroundColor = .clear
        containerView.setupShadowForView(contentView)
        imgView.configureIMGViewForCell(containerView, imgName: "img1")
        imgView.layer.cornerRadius = 8.0
           
        //TODO: - BottomView
        let bottomView = UIView()
        bottomView.backgroundColor = .clear
        contentView.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false

        nameLbl.configureNameForCell(false, line: 2, txtColor: .black, fontSize: 13.0, fontN: fontNamedBold)
        
        let views: [UIView] = [originalPrLbl, nameLbl]
        let sv = createdStackView(views, spacing: 0.0, axis: .vertical, distribution: .fill, alignment: .leading)
        bottomView.addSubview(sv)
        sv.translatesAutoresizingMaskIntoConstraints = false
        
        let contentW = contentView.frame.width
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5.0),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5.0),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5.0),
            containerView.heightAnchor.constraint(equalToConstant: contentW*1.4),
            
            imgView.topAnchor.constraint(equalTo: containerView.topAnchor),
            imgView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            imgView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            imgView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            bottomView.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 8.0),
            bottomView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8.0),
            bottomView.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -8.0),
            bottomView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            sv.topAnchor.constraint(equalTo: bottomView.topAnchor),
            sv.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor),
            sv.trailingAnchor.constraint(lessThanOrEqualTo: bottomView.trailingAnchor),
            sv.bottomAnchor.constraint(lessThanOrEqualTo: bottomView.bottomAnchor),
        ])
        
        setupDarkMode()
    }
    
}

//MARK: - DarkMode

extension WidgetAppCell {
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setupDarkMode()
    }
    
    private func setupDarkMode() {
        if #available(iOS 12.0, *) {
            switch traitCollection.userInterfaceStyle {
            case .light, .unspecified: setupDarkModeView()
            case .dark: setupDarkModeView(true)
            default: break
            }
        } else {
            setupDarkModeView()
        }
    }
    
    private func setupDarkModeView(_ isDarkMode: Bool = false) {
        let conC: UIColor = isDarkMode ? .white : .black
        containerView.layer.shadowColor = conC.cgColor
        containerView.backgroundColor = isDarkMode ? darkColor : .white
        
        originalPrLbl.textColor = isDarkMode ? .white : .darkGray
        nameLbl.textColor = isDarkMode ? .lightGray : .gray
    }
}
