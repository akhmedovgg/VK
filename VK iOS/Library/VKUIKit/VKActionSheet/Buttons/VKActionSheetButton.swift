//
//  VKActionSheetButton.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 03/01/22.
//

import Foundation
import UIKit

class VKActionSheetButton: UIControl {
    var completionHandler: (() -> Void)?
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        if hitTest(touch.location(in: self), with: nil) == nil {
            isHighlighted = false
            cancelTracking(with: nil)
            return false
        }
        return super.continueTracking(touch, with: event)
    }
}
