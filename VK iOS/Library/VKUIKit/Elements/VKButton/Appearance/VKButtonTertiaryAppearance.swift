//
//  VKButtonTertiaryAppearance.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 28/12/21.
//

import Foundation
import UIKit

public class VKButtonTertiaryAppearance: VKButtonAppearance {
	public var normalStateBackgroundColor: UIColor = VKPalette.lightButtonTertiaryBackground!
	public var normalStateTitleColor: UIColor = VKPalette.lightButtonTertiaryForgeground!
	public var normalStateBorderColor: UIColor?
	public var normalStateAlphaValue: CGFloat = 1
	public var normalStateBorderWidth: CGFloat = 0
	
    public var normalStateCornerRadius: CGFloat = 10
    
	public var highlightedStateAlphaValue: CGFloat = 0.4
}
