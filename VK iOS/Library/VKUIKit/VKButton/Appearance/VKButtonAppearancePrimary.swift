//
//  VKButtonAppearancePrimary.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 28/12/21.
//

import Foundation
import UIKit

class VKButtonAppearancePrimary: VKButtonAppearance {
    var backgroundColor: UIColor = VKPalette.lightButtonPrimaryBackground
    var highlightedBackgroundColor: UIColor = VKPalette.lightButtonPrimaryBackground.withAlphaComponent(0.5)
    
    var textColor: UIColor = VKPalette.lightButtonPrimaryForgeground
    var highlightedTextColor: UIColor = VKPalette.lightButtonPrimaryForgeground
    
    var borderColor: UIColor?
    var highlightedBorderColor: UIColor?
    
    var borderWidth: CGFloat = 0
    var cornerRadius: CGFloat = 10
}
