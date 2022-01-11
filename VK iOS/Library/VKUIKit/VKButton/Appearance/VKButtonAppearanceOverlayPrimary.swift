//
//  VKButtonAppearanceOverlayPrimary.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 28/12/21.
//

import Foundation
import UIKit

class VKButtonAppearanceOverlayPrimary: VKButtonAppearance {
    var backgroundColor: UIColor = VKPalette.overlayPrimaryButtonBackground
    var highlightedBackgroundColor: UIColor = VKPalette.overlayPrimaryButtonBackground.withAlphaComponent(0.5)
    
    var textColor: UIColor = VKPalette.overlayPrimaryButtonForgeground
    var highlightedTextColor: UIColor = VKPalette.overlayPrimaryButtonForgeground
    
    var borderColor: UIColor?
    var highlightedBorderColor: UIColor?
    
    var borderWidth: CGFloat = 0
    var cornerRadius: CGFloat = 10
}
