//
//  UserProfileView.swift
//  tinder-template
//
//  Created by Arvind on 01/12/20.
//  Refactored to follow SOLID principles
//

import SwiftUI

// MARK: - User Profile View (Single Responsibility - UI Only)
struct UserProfileView: View {
    @StateObject private var viewModel: UserProfileViewModel
    var onSwiped: (() -> Void)? = nil
    
    init(profile: ProfileModel, onSwiped: (() -> Void)? = nil) {
        self._viewModel = StateObject(wrappedValue: DependencyContainer.shared.makeUserProfileViewModel(for: profile))
        self.onSwiped = onSwiped
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Profile Image
            ProfileImageView(imageName: viewModel.profile.imageName)
            
            // Status Overlay
            StatusOverlayView(
                isVisible: viewModel.isStatusVisible,
                text: viewModel.statusText,
                color: viewModel.statusColor
            )
            
            // Profile Info and Actions
            ProfileInfoView(
                personName: viewModel.profile.personName,
                onRewind: viewModel.handleRewind,
                onDislike: viewModel.handleDislike,
                onLike: viewModel.handleLike,
                onSuperLike: viewModel.handleSuperLike
            )
        }
        .cornerRadius(AppConfig.UI.cornerRadius)
        .offset(x: viewModel.currentOffset)
        .rotationEffect(.degrees(viewModel.rotationAngle))
        .gesture(
            DragGesture()
                .onChanged(viewModel.handleDragChange)
                .onEnded { value in
                    viewModel.handleDragEnd(value)
                    // Check if the swipe was significant enough to remove the card
                    if abs(value.translation.width) > AppConfig.Gesture.swipeThreshold {
                        // Add a small delay to allow the animation to complete
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            onSwiped?()
                        }
                    }
                }
        )
    }
}

// MARK: - Profile Image View (Single Responsibility)
struct ProfileImageView: View {
    let imageName: String
    
    var body: some View {
        ImageProvider(imageName: imageName)
    }
}

// MARK: - Status Overlay View (Single Responsibility)
struct StatusOverlayView: View {
    let isVisible: Bool
    let text: String
    let color: Color
    
    var body: some View {
        ZStack {
            if isVisible {
                color
                    .opacity(0.6)
                TextProvider(labelText: text)
                    .foregroundColor(.white)
            }
        }
    }
}

// MARK: - Profile Info View (Single Responsibility)
struct ProfileInfoView: View {
    let personName: String
    let onRewind: () -> Void
    let onDislike: () -> Void
    let onLike: () -> Void
    let onSuperLike: () -> Void
    
    var body: some View {
        VStack {
            TextWithInfinityWidth(labelText: personName)
                .foregroundColor(.white)
            
            HStack(spacing: 35) {
                BottomButton(imageName: "rewind_circle", action: onRewind)
                BottomButton(imageName: "dismiss_circle", action: onDislike)
                BottomButton(imageName: "like_circle", action: onLike)
                BottomButton(imageName: "super_like_circle", action: onSuperLike)
            }
            .frame(width: 350)
        }
        .padding()
    }
} 