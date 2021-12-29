//
//  ViewController.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 23/12/21.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
	let label: UILabel = {
		let label = UILabel()
		label.font = UIFont(name: "VKSansDisplay-Medium", size: 24)
		label.text = "@Telegram"
		label.textColor = .black
		return label
	}()
	
	let button: VKButton = {
		let button = VKButton(frame: .zero, appearance: VKButtonPrimaryAppearance())
		button.setTitle("Button", for: .normal)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		
		view.addSubview(button)
		view.addSubview(label)
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		button.snp.makeConstraints { make in
			make.centerX.centerY.equalToSuperview()
			make.width.equalTo(93)
			make.height.equalTo(44)
		}
		
		label.snp.makeConstraints { make in
			make.centerX.equalToSuperview()
			make.top.equalTo(button.snp.bottom).inset(-32)
			make.width.height.greaterThanOrEqualTo(2)
		}
	}
}
