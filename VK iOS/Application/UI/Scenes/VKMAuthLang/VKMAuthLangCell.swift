//
//  VKMAuthLangCell.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 01/02/22.
//

import Foundation
import UIKit

class VKMAuthLangCell: UITableViewCell {
    static let identifier = "NoteCell"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = VKPalette.black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    private func configureUI() {
        configureAppearance()
        configureHierarchy()
        configureConstraints()
    }
    
    private func configureAppearance() {
    }
    
    private func configureHierarchy() {
        addSubview(titleLabel)
    }
    
    private func configureConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
}
