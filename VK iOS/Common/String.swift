//
//  String.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 23/02/22.
//

import Foundation

extension String {
    func localized(tableName: String = "Localizable", bundle: Bundle = .main) -> String {
        return NSLocalizedString(self, tableName: tableName, bundle: bundle, value: self, comment: "")
    }
}
