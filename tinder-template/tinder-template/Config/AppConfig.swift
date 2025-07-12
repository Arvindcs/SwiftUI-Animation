//
//  AppConfig.swift
//  tinder-template
//
//  Created by Arvind on 01/12/20.
//  Refactored to follow SOLID principles
//

import SwiftUI

// MARK: - App Configuration (Single Responsibility)
struct AppConfig {
    
    // MARK: - Animation Configuration
    struct Animation {
        static let swipeDuration: Double = 0.5
        static let defaultDuration: Double = 0.3
        static let rotationAngle: Double = 14
    }
    
    // MARK: - Gesture Configuration
    struct Gesture {
        static let swipeThreshold: CGFloat = 150
        static let swipeDistance: CGFloat = 600
    }
    
    // MARK: - UI Configuration
    struct UI {
        static var profileImageSize: CGSize {
            let screen = UIScreen.main.bounds
            let width = screen.width * 0.95 // 95% of screen width
            let height = screen.height * 0.77 // 77% of screen height
            return CGSize(width: width, height: height)
        }
        static let cornerRadius: CGFloat = 22
        static let buttonSize: CGSize = CGSize(width: 70, height: 70)
        static let systemButtonSize: CGSize = CGSize(width: 25, height: 20)
        static let avatarSize: CGSize = CGSize(width: 80, height: 80)
        static let avatarCornerRadius: CGFloat = 40
    }
    
    // MARK: - Colors Configuration
    struct Colors {
        static let background = Color(red: 0.92, green: 0.92, blue: 0.92)
        static let likeColor = Color.green
        static let dislikeColor = Color.red
        static let primaryText = Color.primary
        static let secondaryText = Color.gray
        static let whiteText = Color.white
    }
    
    // MARK: - Text Configuration
    struct Text {
        static let appTitle = "tinder"
        static let likeText = "LIKED"
        static let dislikeText = "NOPE"
        static let loadingText = "Loading profiles..."
        static let findingPeopleText = "Finding people near you"
    }
} 
