//
//  VKAlertAction.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 31/12/21.
//

import Foundation
import UIKit

enum VKAlertActionStyle {
    case cancel
    case `default`
    case destructive
}

class VKAlertAction: NSObject {
    let style: VKAlertActionStyle
    let title: String
    let completionHandler: (() -> Void)?
    
    init(style: VKAlertActionStyle, title: String, completionHandler: (() -> Void)? = nil) {
        self.style = style
        self.title = title
        self.completionHandler = completionHandler
    }
}
