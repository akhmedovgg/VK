//
//  UIImage.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 07/03/22.
//

import Foundation
import UIKit

extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        imageView.contentMode = .scaleAspectFit
        imageView.image = self
        let renderer = UIGraphicsImageRenderer(bounds: imageView.bounds)
        return renderer.image { context in
            return imageView.layer.render(in: context.cgContext)
        }
    }
}
