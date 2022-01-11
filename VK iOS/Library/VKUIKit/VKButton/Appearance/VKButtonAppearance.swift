//
//  VKButtonAppearance.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 28/12/21.
//

import Foundation
import UIKit

protocol VKButtonAppearance {
	var backgroundColor: UIColor { get }
    var highlightedBackgroundColor: UIColor { get }
    
	var textColor: UIColor { get }
    var highlightedTextColor: UIColor { get }
    
	var borderColor: UIColor? { get }
    var highlightedBorderColor: UIColor? { get }
    
	var borderWidth: CGFloat { get }
    var cornerRadius: CGFloat { get }
}
