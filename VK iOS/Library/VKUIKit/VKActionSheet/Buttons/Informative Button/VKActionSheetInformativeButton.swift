//
//  VKActionSheetInformativeButton.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 10/01/22.
//

import Foundation
import UIKit

class VKActionSheetInformativeButton: VKActionSheetButton {
    let appearance: VKActionSheetInformativeButtonAppearance
    let iconImageView: UIImageView
    let titleLabel: UILabel
    let descriptionLabel: UILabel
    let bottomLine: UIView
    
    override var isHighlighted: Bool {
        didSet {
            let colorChanged = backgroundColor != appearance.backgroundColor
            if isHighlighted && !colorChanged {
                if let highlightedTintColor = appearance.highlightedIconTintColor {
                    iconImageView.tintColor = highlightedTintColor
                }
                
                titleLabel.textColor = appearance.highlightedTitleColor
                descriptionLabel.textColor = appearance.highlightedDescriptionColor
                backgroundColor = appearance.highlightedBackgroundColor
                bottomLine.backgroundColor = appearance.highlightedBottomLineColor
            } else if !isHighlighted && colorChanged {
                if let tintColor = appearance.iconTintColor {
                    iconImageView.tintColor = tintColor
                }
                
                titleLabel.textColor = appearance.titleColor
                descriptionLabel.textColor = appearance.descriptionColor
                backgroundColor = appearance.backgroundColor
                bottomLine.backgroundColor = appearance.bottomLineColor
            }
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                if let iconTintColor = appearance.iconTintColor {
                    iconImageView.tintColor = iconTintColor
                }
                
                titleLabel.textColor = appearance.titleColor
                descriptionLabel.textColor = appearance.descriptionColor
                backgroundColor = appearance.backgroundColor
            } else {
                if let disabledIconTintColor = appearance.disabledIconTintColor {
                    iconImageView.tintColor = disabledIconTintColor
                }
                
                titleLabel.textColor = appearance.disabledTitleColor
                descriptionLabel.textColor = appearance.disabledDescriptionColor
                backgroundColor = appearance.disabledBackgroundColor
            }
        }
    }
    
    required init(appearance: VKActionSheetInformativeButtonAppearance, iconImage: UIImage, title: String, description: String, completionHandler: (() -> Void)? = nil) {
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
        self.descriptionLabel = {
            let label = UILabel()
            label.text = description
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
        if let iconTintColor = appearance.iconTintColor {
            iconImageView.tintColor = iconTintColor
        }
        
        titleLabel.textColor = appearance.titleColor
        titleLabel.font = appearance.titleFont
        
        descriptionLabel.textColor = appearance.descriptionColor
        descriptionLabel.font = appearance.descriptionFont
        
        backgroundColor = appearance.backgroundColor
        
        bottomLine.backgroundColor = appearance.bottomLineColor
        bottomLine.isHidden = !appearance.hasBottomLine
    }
    
    func setupViewHierarchy() {
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(bottomLine)
    }
    
    func setupConstraints() {
        iconImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(18)
            make.width.height.equalTo(28)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(13)
            make.leading.equalTo(iconImageView.snp.trailing).inset(-14)
            make.trailing.equalToSuperview().inset(18)
            make.height.greaterThanOrEqualTo(0)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-2)
            make.leading.equalTo(iconImageView.snp.trailing).inset(-14)
            make.trailing.equalToSuperview().inset(18)
            make.height.greaterThanOrEqualTo(0)
        }
        
        bottomLine.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(0.5)
        }
        
        snp.makeConstraints { make in
            make.height.equalTo(67)
        }
    }
}
