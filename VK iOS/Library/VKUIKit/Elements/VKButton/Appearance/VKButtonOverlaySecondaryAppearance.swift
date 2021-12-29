//
//  VKButtonOverlaySecondaryAppearance.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 28/12/21.
//

import Foundation
import UIKit

public class VKButtonOverlaySecondaryAppearance: VKButtonAppearance {
	public var normalStateBackgroundColor: UIColor = VKPalette.overlaySecondaryButtonBackground!
	public var normalStateTitleColor: UIColor = VKPalette.overlaySecondaryButtonForgeground!
	public var normalStateBorderColor: UIColor?
	public var normalStateAlphaValue: CGFloat = 1
	public var normalStateBorderWidth: CGFloat = 0
    
    public var normalStateCornerRadius: CGFloat = 10
    
	public var highlightedStateAlphaValue: CGFloat = 0.4
}
