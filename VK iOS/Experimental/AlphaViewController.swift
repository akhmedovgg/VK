//
//  AlphaViewController.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 28/12/21.
//

import Foundation
import UIKit

class AlphaViewController: UIViewController {
    @IBOutlet weak var mainIcon: UIImageView!
    @IBOutlet var mainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainButton.addTarget(self, action: #selector(didTap(_:)), for: .touchUpInside)
    }
    
    @objc func didTap(_ sender: UIButton) {
        mainIcon.image = mainIcon.image!.withRenderingMode(.alwaysTemplate)
        mainIcon.tintColor = .init(red: CGFloat.random(in: 0...255) / 255,
                                   green: CGFloat.random(in: 0...255) / 255,
                                   blue: CGFloat.random(in: 0...255) / 255,
                                   alpha: 1)
    }
}
