//
//  VKButtonAppearanceSecondary.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 28/12/21.
//

import Foundation
import UIKit

class VKButtonAppearanceSecondary: VKButtonAppearance {
    var backgroundColor: UIColor = VKPalette.lightButtonSecondaryBackground
    var highlightedBackgroundColor: UIColor = VKPalette.lightButtonSecondaryBackground.withAlphaComponent(0.05)
    
    var textColor: UIColor = VKPalette.lightButtonSecondaryForgeground
    var highlightedTextColor: UIColor = VKPalette.lightButtonSecondaryForgeground.withAlphaComponent(0.5)
    
    var borderColor: UIColor?
    var highlightedBorderColor: UIColor?
    
    var borderWidth: CGFloat = 0
    var cornerRadius: CGFloat = 10
}
