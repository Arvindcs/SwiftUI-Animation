//
//  DependencyContainer.swift
//  tinder-template
//
//  Created by Arvind on 01/12/20.
//  Refactored to follow SOLID principles
//

import SwiftUI
import Combine

// MARK: - Dependency Container (Dependency Inversion Principle)
class DependencyContainer: ObservableObject {
    static let shared = DependencyContainer()
    
    // Services
    private(set) lazy var profileService: ProfileServiceProtocol = ProfileService()
    private(set) lazy var gestureManager: GestureManagerProtocol = GestureManager()
    private(set) lazy var actionManager: ActionManagerProtocol = ActionManager()
    
    // View Models
    private(set) lazy var mainViewModel = MainViewModel(
        profileService: profileService
    )
    
    private init() {}
    
    // Factory method for creating UserProfileViewModel with dependencies
    func makeUserProfileViewModel(for profile: ProfileModel) -> UserProfileViewModel {
        return UserProfileViewModel(
            profile: profile,
            gestureManager: GestureManager(), // Create new instance for each card
            actionManager: actionManager
        )
    }
    
    // Reset method for testing
    func reset() {
        // This would be used in testing to reset all dependencies
    }
} 