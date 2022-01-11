//
//  VKAlertButton.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 11/01/22.
//

import Foundation
import UIKit

class VKAlertButton: VKButton {
    private let action: VKAlertAction
    
    required init(action: VKAlertAction) {
        self.action = action
        
        let appearance: VKButtonAppearance
        switch action.style {
        case .cancel:
            appearance = VKButtonAppearanceAlertDefault()
        case .`default`:
            appearance = VKButtonAppearanceAlertDefault()
        case .destructive:
            appearance = VKButtonAppearanceAlertDestructive()
        }
        
        let size = VKButtonSizeMediumWithoutIcon()
        
        super.init(frame: .zero, appearance: appearance, size: size)
        
        self.titleLabel.text = action.title
        self.titleLabel.textAlignment = .center
        self.titleLabel.font = .systemFont(ofSize: size.fontSize, weight: action.style == .cancel ? .semibold : .regular)
        self.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    required init(frame: CGRect = .zero, appearance: VKButtonAppearance, size: VKButtonSize) {
        fatalError("init(frame:appearance:size:) has not been implemented")
    }
}
