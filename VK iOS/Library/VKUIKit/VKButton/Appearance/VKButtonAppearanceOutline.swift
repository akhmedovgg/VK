//
//  VKButtonAppearanceOutline.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 28/12/21.
//

import Foundation
import UIKit

class VKButtonAppearanceOutline: VKButtonAppearance {
	var backgroundColor: UIColor = VKPalette.clear
	var textColor: UIColor = VKPalette.lightButtonOutlineForgeground
	var borderColor: UIColor? = VKPalette.lightButtonOutlineBorder
	var borderWidth: CGFloat = 2
    var cornerRadius: CGFloat = 10
	var highlightedAlphaValue: CGFloat = 0.4
}
