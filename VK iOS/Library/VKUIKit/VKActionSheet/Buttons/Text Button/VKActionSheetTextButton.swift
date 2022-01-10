//
//  VKActionSheetButton.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 03/01/22.
//

import Foundation
import UIKit

class VKActionSheetTextButton: VKActionSheetButton {
    let appearance: VKActionSheetTextButtonAppearance
    
    let titleLabel: UILabel
    
    let bottomLine: UIView
    
    override var isHighlighted: Bool {
        didSet {
            let colorChanged = backgroundColor != appearance.backgroundColor
            if isHighlighted && !colorChanged {
                titleLabel.textColor = appearance.highlightedTitleColor
                backgroundColor = appearance.highlightedBackgroundColor
                bottomLine.backgroundColor = appearance.highlightedBottomLineColor
            } else if !isHighlighted && colorChanged {
                titleLabel.textColor = appearance.titleColor
                backgroundColor = appearance.backgroundColor
                bottomLine.backgroundColor = appearance.bottomLineColor
            }
        }
    }
    
    required init(appearance: VKActionSheetTextButtonAppearance, title: String, completionHandler: (() -> Void)? = nil) {
        self.appearance = appearance
        self.titleLabel = {
            let label = UILabel()
            label.text = title
            label.numberOfLines = 1
            label.textAlignment = .center
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
    
    private func setupAppearance() {
        titleLabel.textColor = appearance.titleColor        
        titleLabel.font = appearance.titleFont
        
        backgroundColor = appearance.backgroundColor
        
        bottomLine.backgroundColor = appearance.bottomLineColor
        bottomLine.isHidden = !appearance.hasBottomLine
    }
    
    private func setupViewHierarchy() {
        addSubview(titleLabel)
        addSubview(bottomLine)
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
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
