//
//  VKButtonAppearanceCommerce.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 28/12/21.
//

import Foundation
import UIKit

class VKButtonAppearanceCommerce: VKButtonAppearance {
	var backgroundColor: UIColor = VKPalette.lightButtonCommerceBackground
	var textColor: UIColor = VKPalette.lightButtonCommerceForgeground
	var borderColor: UIColor?
	var borderWidth: CGFloat = 0
    var cornerRadius: CGFloat = 10
	var highlightedAlphaValue: CGFloat = 0.4
}
