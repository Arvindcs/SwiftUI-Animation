//
//  ActionManager.swift
//  tinder-template
//
//  Created by Arvind on 01/12/20.
//  Refactored to follow SOLID principles
//

import SwiftUI
import Combine

// MARK: - Action Types (Open/Closed Principle)
enum ProfileAction {
    case like
    case dislike
    case superLike
    case rewind
}

// MARK: - Action Manager Protocol (Dependency Inversion)
protocol ActionManagerProtocol {
    var actionPublisher: AnyPublisher<ProfileAction, Never> { get }
    func performAction(_ action: ProfileAction, for profileId: UUID)
    func getOffsetForAction(_ action: ProfileAction) -> CGFloat
}

// MARK: - Action Manager Implementation (Single Responsibility)
class ActionManager: ObservableObject, ActionManagerProtocol {
    @Published private var lastAction: ProfileAction?
    
    var actionPublisher: AnyPublisher<ProfileAction, Never> {
        $lastAction
            .compactMap { $0 }
            .eraseToAnyPublisher()
    }
    
    private let likeOffset: CGFloat = AppConfig.Gesture.swipeDistance
    private let dislikeOffset: CGFloat = -AppConfig.Gesture.swipeDistance
    
    func performAction(_ action: ProfileAction, for profileId: UUID) {
        lastAction = action
        
        // Here you would typically notify other services about the action
        // For example, update the profile service, analytics, etc.
        print("Performed action: \(action) for profile: \(profileId)")
    }
    
    func getOffsetForAction(_ action: ProfileAction) -> CGFloat {
        switch action {
        case .like:
            return likeOffset
        case .dislike:
            return dislikeOffset
        case .superLike:
            return likeOffset // Could be different for super like
        case .rewind:
            return 0 // No offset for rewind
        }
    }
    
    func getRotationForAction(_ action: ProfileAction) -> Double {
        switch action {
        case .like:
            return AppConfig.Animation.rotationAngle
        case .dislike:
            return -AppConfig.Animation.rotationAngle
        case .superLike:
            return AppConfig.Animation.rotationAngle
        case .rewind:
            return 0
        }
    }
} 