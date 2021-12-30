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
	var textColor: UIColor = VKPalette.buttonOverlayOutlineForgeground
	var borderColor: UIColor? = VKPalette.buttonOverlayOutlineOutline
	var borderWidth: CGFloat = 2
    var cornerRadius: CGFloat = 10
	var highlightedAlphaValue: CGFloat = 0.4
}
