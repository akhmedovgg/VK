//
//  VKActionSheetButton.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 10/01/22.
//

import Foundation
import UIKit

class VKActionSheetIconButton: VKActionSheetButton {
    let appearance: VKActionSheetIconButtonAppearance
    
    let iconImageView: UIImageView
    
    let titleLabel: UILabel
    
    let bottomLine: UIView
    
    override var isHighlighted: Bool {
        didSet {
            let colorChanged = backgroundColor != appearance.backgroundColor
            if isHighlighted && !colorChanged {
                if let tintColor = appearance.highlightedIconTintColor {
                    iconImageView.tintColor = tintColor
                }
                titleLabel.textColor = appearance.highlightedTitleColor
                backgroundColor = appearance.highlightedBackgroundColor
                bottomLine.backgroundColor = appearance.highlightedBottomLineColor
            } else if !isHighlighted && colorChanged {
                if let tintColor = appearance.iconTintColor {
                    iconImageView.tintColor = tintColor
                }
                titleLabel.textColor = appearance.titleColor
                backgroundColor = appearance.backgroundColor
                bottomLine.backgroundColor = appearance.bottomLineColor
            }
        }
    }
    
    required init(appearance: VKActionSheetIconButtonAppearance, iconImage: UIImage, title: String, completionHandler: (() -> Void)? = nil) {
        self.appearance = appearance
        self.iconImageView = {
            let imageView = UIImageView()
            imageView.image = iconImage
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
        self.titleLabel = {
            let label = UILabel()
            label.text = title
            label.numberOfLines = 1
            label.textAlignment = .left
            return label
        }()
        self.bottomLine = UIView()
        
        super.init(frame: .zero)
        
        self.completionHandler = completionHandler
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        self.setupAppearance()
        self.setupViewHierarchy()
        self.setupConstraints()
    }
    
    func setupAppearance() {
        if let tintColor = appearance.iconTintColor {
            iconImageView.tintColor = tintColor
        }
        
        titleLabel.textColor = appearance.titleColor
        titleLabel.font = appearance.titleFont
        
        backgroundColor = appearance.backgroundColor
        
        bottomLine.backgroundColor = appearance.bottomLineColor
        bottomLine.isHidden = !appearance.hasBottomLine
    }
    
    func setupViewHierarchy() {
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(bottomLine)
    }
    
    func setupConstraints() {
        iconImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(18)
            make.width.height.equalTo(28)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(iconImageView.snp.trailing).inset(-14)
            make.trailing.equalToSuperview().inset(16)
            make.height.greaterThanOrEqualTo(0)
        }
        
        bottomLine.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(0.5)
        }
        
        snp.makeConstraints { make in
            make.height.equalTo(56)
        }
    }
}
