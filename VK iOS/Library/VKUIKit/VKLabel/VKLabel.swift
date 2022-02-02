//
//  VKLabel.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 03/02/22.
//

import Foundation
import UIKit

class VKLabel: UILabel {
    func makeScreenshot() -> UIImage {
        self.sizeToFit()
        let renderer = UIGraphicsImageRenderer(bounds: self.bounds)
        return renderer.image { context in
            self.layer.render(in: context.cgContext)
        }.withRenderingMode(.alwaysTemplate)
    }
}
