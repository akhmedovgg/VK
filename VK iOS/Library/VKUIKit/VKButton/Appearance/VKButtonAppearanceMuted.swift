//
//  VKButtonAppearanceMuted.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 28/12/21.
//

import Foundation
import UIKit

class VKButtonAppearanceMuted: VKButtonAppearance {
	var backgroundColor: UIColor = VKPalette.lightButtonMutedBackground
	var textColor: UIColor = VKPalette.lightButtonMutedForgeground
	var borderColor: UIColor?
	var borderWidth: CGFloat = 0
    var cornerRadius: CGFloat = 10
	var highlightedAlphaValue: CGFloat = 0.4
}
