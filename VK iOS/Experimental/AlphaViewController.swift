//
//  AlphaViewController.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 28/12/21.
//

import Foundation
import UIKit

class AlphaViewController: UIViewController {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var containerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containerView.backgroundColor = VKPalette.azure300
        containerView.layer.cornerRadius = 10
    }
}
