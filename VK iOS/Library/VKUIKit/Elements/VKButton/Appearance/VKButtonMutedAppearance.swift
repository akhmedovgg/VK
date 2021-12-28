//
//  VKButtonMutedAppearance.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 28/12/21.
//

import Foundation
import UIKit

public class VKButtonMutedAppearance: VKButtonAppearance {
	public var normalStateBackgroundColor: UIColor = VKPalette.lightButtonMutedBackground!
	public var normalStateTitleColor: UIColor = VKPalette.lightButtonMutedForgeground!
	public var normalStateBorderColor: UIColor?
	public var normalStateAlphaValue: CGFloat = 1
	public var normalStateBorderWidth: CGFloat = 0
	
	public var highlightedStateAlphaValue: CGFloat = 0.4
}
