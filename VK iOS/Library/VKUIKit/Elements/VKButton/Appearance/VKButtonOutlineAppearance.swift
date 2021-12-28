//
//  VKButtonOutlineAppearance.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 28/12/21.
//

import Foundation
import UIKit

public class VKButtonOutlineAppearance: VKButtonAppearance {
	public var normalStateBackgroundColor: UIColor = VKPalette.clear!
	public var normalStateTitleColor: UIColor = VKPalette.lightButtonOutlineForgeground!
	public var normalStateBorderColor: UIColor? = VKPalette.lightButtonOutlineBorder
	public var normalStateAlphaValue: CGFloat = 1
	public var normalStateBorderWidth: CGFloat = 2
	
	public var highlightedStateAlphaValue: CGFloat = 0.4
}
