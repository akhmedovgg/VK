//
//  VKButtonOverlayOutlineAppearance.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 28/12/21.
//

import Foundation
import UIKit

public class VKButtonOverlayOutlineAppearance: VKButtonAppearance {
	public var normalStateBackgroundColor: UIColor = VKPalette.clear!
	public var normalStateTitleColor: UIColor = VKPalette.buttonOverlayOutlineForgeground!
	public var normalStateBorderColor: UIColor? = VKPalette.buttonOverlayOutlineOutline
	public var normalStateAlphaValue: CGFloat = 1
	public var normalStateBorderWidth: CGFloat = 2
    
    public var normalStateCornerRadius: CGFloat = 10
    
	public var highlightedStateAlphaValue: CGFloat = 0.4
}
