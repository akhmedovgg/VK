//
//  VKColor.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 28/12/21.
//

import Foundation
import UIKit

class VKColor: UIColor {
	convenience init?(hex: String) {
		let red, green, blue, alpha: CGFloat
		
		if hex.hasPrefix("#") {
			let start = hex.index(hex.startIndex, offsetBy: 1)
			let hexColor = String(hex[start...])
			
			if hexColor.count == 8 {
				let scanner = Scanner(string: hexColor)
				var hexNumber: UInt64 = 0
				
				if scanner.scanHexInt64(&hexNumber) {
					red = CGFloat((hexNumber & 0xff000000) >> 24) / 255
					green = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
					blue = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
					alpha = CGFloat(hexNumber & 0x000000ff) / 255
					
					self.init(red: red, green: green, blue: blue, alpha: alpha)
					return
				}
			}
		}
		
		return nil
	}
    
    static func random() -> VKColor {
        let red = CGFloat.random(in: 0...255) / 255
        let green = CGFloat.random(in: 0...255) / 255
        let blue = CGFloat.random(in: 0...255) / 255
        return VKColor(red: red, green: green, blue: blue, alpha: 1)
    }
}
