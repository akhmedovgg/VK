//
//  VKButtonOverlayPrimaryAppearance.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 28/12/21.
//

import Foundation
import UIKit

public class VKButtonOverlayPrimaryAppearance: VKButtonAppearance {
	public var normalStateBackgroundColor: UIColor = VKPalette.overlayPrimaryButtonBackground!
	public var normalStateTitleColor: UIColor = VKPalette.overlayPrimaryButtonForgeground!
	public var normalStateBorderColor: UIColor?
	public var normalStateAlphaValue: CGFloat = 1
	public var normalStateBorderWidth: CGFloat = 0
    
    public var normalStateCornerRadius: CGFloat = 10
    
	public var highlightedStateAlphaValue: CGFloat = 0.4
}
