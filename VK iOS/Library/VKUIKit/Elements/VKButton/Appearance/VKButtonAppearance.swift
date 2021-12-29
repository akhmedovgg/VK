//
//  VKButtonAppearance.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 28/12/21.
//

import Foundation
import UIKit

public protocol VKButtonAppearance {
	var normalStateBackgroundColor: UIColor { get }
	var normalStateTitleColor: UIColor { get }
	var normalStateBorderColor: UIColor? { get }
	var normalStateAlphaValue: CGFloat { get }
	var normalStateBorderWidth: CGFloat { get }
    
    var normalStateCornerRadius: CGFloat { get }
    
	var highlightedStateAlphaValue: CGFloat { get }
}
