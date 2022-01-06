//
//  VKActionSheetButton.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 03/01/22.
//

import Foundation
import UIKit

class VKActionSheetTextButton: UIControl, VKActionSheetButton {
    let appearance: VKActionSheetTextButtonAppearance
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Отменить"
        return label
    }()
    
    let bottomLine: UIView = {
        let view = UIView()
        return view
    }()
    
    override var isHighlighted: Bool {
        didSet {
            let colorChanged = backgroundColor != appearance.backgroundColor
            if isHighlighted && !colorChanged {
                backgroundColor = appearance.highlightedBackgroundColor
            } else if !isHighlighted && colorChanged {
                backgroundColor = appearance.backgroundColor
            }
        }
    }
    
    required init(appearance: VKActionSheetTextButtonAppearance) {
        self.appearance = appearance
        super.init(frame: .zero)
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
        backgroundColor = appearance.backgroundColor
        titleLabel.textColor = appearance.titleColor
        titleLabel.font = .systemFont(ofSize: 20, weight: .regular)
        bottomLine.backgroundColor = appearance.bottomLineColor
        bottomLine.isHidden = !appearance.hasBottomLine
    }
    
    private func setupViewHierarchy() {
        addSubview(titleLabel)
        addSubview(bottomLine)
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
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
