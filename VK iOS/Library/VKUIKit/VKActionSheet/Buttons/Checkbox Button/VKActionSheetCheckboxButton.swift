//
//  VKActionSheetCheckboxButton.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 11/01/22.
//

import Foundation
import UIKit

class VKActionSheetCheckboxButton: VKActionSheetButton {
    let appearance: VKActionSheetCheckboxButtonAppearance
    let checkboxImageView: UIImageView
    let titleLabel: UILabel
    let bottomLine: UIView
    
    override var isHighlighted: Bool {
        didSet {
            let colorChanged = backgroundColor != appearance.backgroundColor
            if isHighlighted && !colorChanged {
                if let highlightedCheckboxTintColor = appearance.highlightedCheckboxTintColor {
                    checkboxImageView.tintColor = highlightedCheckboxTintColor
                }
                
                titleLabel.textColor = appearance.highlightedTitleColor
                backgroundColor = appearance.highlightedBackgroundColor
                bottomLine.backgroundColor = appearance.highlightedBottomLineColor
            } else if !isHighlighted && colorChanged {
                if let checkboxTintColor = appearance.checkboxTintColor {
                    checkboxImageView.tintColor = checkboxTintColor
                }
                
                titleLabel.textColor = appearance.titleColor
                backgroundColor = appearance.backgroundColor
                bottomLine.backgroundColor = appearance.bottomLineColor
            }
        }
    }
    
    var isChecked: Bool = false {
        didSet {
            checkboxImageView.isHidden = !isChecked
        }
    }
    
    required init(appearance: VKActionSheetCheckboxButtonAppearance,
                  iconImage: UIImage? = nil,
                  title: String,
                  completionHandler: (() -> Void)? = nil) {
        self.appearance = appearance
        self.checkboxImageView = {
            let imageView = UIImageView()
            imageView.image = iconImage ?? UIImage(named: "check_circle_on_24")?.withRenderingMode(.alwaysTemplate)
            imageView.contentMode = .scaleAspectFit
            imageView.isHidden = true
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
        if let checkboxTintColor = appearance.checkboxTintColor {
            checkboxImageView.tintColor = checkboxTintColor
        }
        
        titleLabel.textColor = appearance.titleColor
        titleLabel.font = appearance.titleFont
        
        backgroundColor = appearance.backgroundColor
        
        bottomLine.backgroundColor = appearance.bottomLineColor
        bottomLine.isHidden = !appearance.hasBottomLine
    }
    
    func setupViewHierarchy() {
        addSubview(checkboxImageView)
        addSubview(titleLabel)
        addSubview(bottomLine)
    }
    
    func setupConstraints() {
        checkboxImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(20)
            make.width.height.equalTo(24)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(20)
            make.height.greaterThanOrEqualTo(0)
            make.trailing.equalTo(checkboxImageView.snp.leading).inset(-20)
        }
        
        bottomLine.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(0.5)
        }
        
        snp.makeConstraints { make in
            make.height.equalTo(55)
        }
    }
}
