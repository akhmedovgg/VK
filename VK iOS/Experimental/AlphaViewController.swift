//
//  AlphaViewController.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 28/12/21.
//

import Foundation
import UIKit

class AlphaViewController: UIViewController {
    @IBOutlet weak var plusIcon: UIImageView!
    @IBOutlet var mainButton: UIButton!
    @IBOutlet var gestureRecognizer: UIGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainButton.addTarget(self, action: #selector(didTap(_:)), for: .touchUpInside)
        gestureRecognizer.state = .began
        gestureRecognizer.addTarget(self, action: #selector(handleGesture(_:)))
    }
    
    @objc func didTap(_ sender: UIButton) {
        print(#function)
    }
    
    @IBAction func handleGesture(_ sender: UIGestureRecognizer) {
        print(#function)
    }
}
