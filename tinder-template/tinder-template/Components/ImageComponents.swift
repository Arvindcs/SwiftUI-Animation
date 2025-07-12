//
//  ImageComponents.swift
//  tinder-template
//
//  Created by Arvind on 01/12/20.
//  Refactored to follow SOLID principles
//

import SwiftUI

// MARK: - Image Component Protocols (Interface Segregation)
protocol ImageDisplayable {
    var imageName: String { get }
    var size: CGSize { get }
    var contentMode: ContentMode { get }
}

protocol ImageStylable {
    var cornerRadius: CGFloat { get }
    var shadowRadius: CGFloat { get }
    var shadowColor: Color { get }
}

// MARK: - Base Image Component (Single Responsibility)
struct BaseImageComponent: View {
    let displayable: ImageDisplayable
    let stylable: ImageStylable
    
    init(displayable: ImageDisplayable, stylable: ImageStylable) {
        self.displayable = displayable
        self.stylable = stylable
    }
    
    var body: some View {
        Image(displayable.imageName)
            .resizable()
            .aspectRatio(contentMode: displayable.contentMode)
            .frame(width: displayable.size.width, height: displayable.size.height)
            .cornerRadius(stylable.cornerRadius)
            .shadow(radius: stylable.shadowRadius, x: 0, y: 2)
    }
}

// MARK: - Profile Image Component (Single Responsibility)
struct ProfileImageComponent: View, ImageDisplayable, ImageStylable {
    let imageName: String
    let size: CGSize = AppConfig.UI.profileImageSize
    let contentMode: ContentMode = .fill
    let cornerRadius: CGFloat = 0
    let shadowRadius: CGFloat = 0
    let shadowColor: Color = .clear
    
    var body: some View {
        BaseImageComponent(displayable: self, stylable: self)
    }
}

// MARK: - Avatar Image Component (Single Responsibility)
struct AvatarImageComponent: View, ImageDisplayable, ImageStylable {
    let imageName: String
    let size: CGSize = AppConfig.UI.avatarSize
    let contentMode: ContentMode = .fill
    let cornerRadius: CGFloat = AppConfig.UI.avatarCornerRadius
    let shadowRadius: CGFloat = 4
    let shadowColor: Color = .black.opacity(0.2)
    
    var body: some View {
        BaseImageComponent(displayable: self, stylable: self)
    }
}

// MARK: - Profile Card Component (Single Responsibility)
struct ProfileCardComponent: View {
    let imageName: String
    
    var body: some View {
        VStack {
            AvatarImageComponent(imageName: imageName)
            
            Text(AppConfig.Text.findingPeopleText)
                .font(.subheadline)
                .font(.system(size: 8))
                .foregroundColor(AppConfig.Colors.secondaryText)
        }
    }
}

// MARK: - Legacy Support (for backward compatibility)
struct ImageProvider: View {
    let imageName: String
    
    var body: some View {
        ProfileImageComponent(imageName: imageName)
    }
}

struct ProfileImageProvider: View {
    var body: some View {
        ProfileCardComponent(imageName: "profile")
    }
} 