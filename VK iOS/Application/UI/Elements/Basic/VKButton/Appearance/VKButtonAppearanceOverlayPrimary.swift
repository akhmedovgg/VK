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
	var textColor: UIColor = VKPalette.overlayPrimaryButtonForgeground
	var borderColor: UIColor?
	var borderWidth: CGFloat = 0
    var cornerRadius: CGFloat = 10
	var highlightedAlphaValue: CGFloat = 0.4
}
