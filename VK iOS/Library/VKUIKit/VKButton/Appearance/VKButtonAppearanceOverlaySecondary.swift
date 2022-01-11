//
//  VKButtonAppearanceOverlaySecondary.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 28/12/21.
//

import Foundation
import UIKit

class VKButtonAppearanceOverlaySecondary: VKButtonAppearance {
    var backgroundColor: UIColor = VKPalette.overlaySecondaryButtonBackground
    var highlightedBackgroundColor: UIColor = VKPalette.overlaySecondaryButtonBackground.withAlphaComponent(0.5)
    
    var textColor: UIColor = VKPalette.overlaySecondaryButtonForgeground
    var highlightedTextColor: UIColor = VKPalette.overlaySecondaryButtonForgeground
    
    var borderColor: UIColor?
    var highlightedBorderColor: UIColor?
    
    var borderWidth: CGFloat = 0
    var cornerRadius: CGFloat = 10
}
