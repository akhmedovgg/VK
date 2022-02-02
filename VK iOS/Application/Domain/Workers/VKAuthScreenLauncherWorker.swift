//
//  VKAuthScreenLauncherWorker.swift
//  VK iOS
//
//  Created by Sherzod Akhmedov on 01/02/22.
//

import Foundation

// MARK: - VKAuthScreenLauncherError

enum VKAuthScreenLauncherError: Equatable, Error {
    case unknownError(String)
}

func == (lhs: VKAuthScreenLauncherError, rhs: VKAuthScreenLauncherError) -> Bool {
    switch (lhs, rhs) {
    case (.unknownError(let r1), .unknownError(let r2)) where r1 == r2: return true
    default: return false
    }
}

// MARK: - VKAuthScreenResult

enum VKAuthScreenResult {
    case success
    case failure(VKAuthScreenLauncherError)
    case cancelled
}

typealias VKAuthScreenLauncherCompletionHandler = (VKAuthScreenResult) -> Void

// MARK: - VKAuthScreenLauncherService

protocol VKAuthScreenLauncherService {
    func launch(completionHandler: @escaping VKAuthScreenLauncherCompletionHandler)
}

// MARK: - VKAuthScreenLauncherWorker

class VKAuthScreenLauncherWorker {
    private let launcherService: VKAuthScreenLauncherService
    
    required init(launcherService: VKAuthScreenLauncherService) {
        self.launcherService = launcherService
    }
    
    func launch(completionHandler: @escaping VKAuthScreenLauncherCompletionHandler) {
        self.launcherService.launch(completionHandler: completionHandler)
    }
}
