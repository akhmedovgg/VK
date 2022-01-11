//
//  VKButtonAppearanceOverlayOutline.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 28/12/21.
//

import Foundation
import UIKit

class VKButtonAppearanceOverlayOutline: VKButtonAppearance {
    var backgroundColor: UIColor = VKPalette.clear
    var highlightedBackgroundColor: UIColor = VKPalette.clear
    
    var textColor: UIColor = VKPalette.buttonOverlayOutlineForgeground
    var highlightedTextColor: UIColor = VKPalette.buttonOverlayOutlineForgeground.withAlphaComponent(0.5)
    
    var borderColor: UIColor? = VKPalette.buttonOverlayOutlineOutline
    var highlightedBorderColor: UIColor? = VKPalette.buttonOverlayOutlineOutline.withAlphaComponent(0.5)
    
    var borderWidth: CGFloat = 2
    var cornerRadius: CGFloat = 10
}
