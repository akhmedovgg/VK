//
//  VKActionSheetCheckboxButtonAppearance.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 11/01/22.
//

import Foundation
import UIKit

protocol VKActionSheetCheckboxButtonAppearance {
    var checkboxTintColor: UIColor? { get }
    var highlightedCheckboxTintColor: UIColor? { get }
    
    var titleColor: UIColor { get }
    var highlightedTitleColor: UIColor { get }
    
    var titleFont: UIFont { get }
    
    var backgroundColor: UIColor { get }
    var highlightedBackgroundColor: UIColor { get }
    
    var hasBottomLine: Bool { get }
    var bottomLineColor: UIColor { get }
    var highlightedBottomLineColor: UIColor { get }
}
