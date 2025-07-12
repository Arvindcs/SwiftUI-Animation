//
//  MainView.swift
//  tinder-template
//
//  Created by Arvind on 01/12/20.
//  Refactored to follow SOLID principles
//

import SwiftUI

// MARK: - Main View (Single Responsibility - UI Only)
struct MainView: View {
    @StateObject private var viewModel = DependencyContainer.shared.mainViewModel
    
    var body: some View {
        VStack {
            HeaderView(onMenuTapped: viewModel.onMenuButtonTapped)
            
            ZStack {
                if viewModel.isLoading || viewModel.profiles.isEmpty {
                    LoadingView()
                } else {
                    ProfileStackView(profiles: viewModel.profiles) { swipedProfile in
                        withAnimation {
                            viewModel.removeProfile(swipedProfile)
                        }
                    }
                }
            }
            .padding()
        }
        .background(AppBackgroundView())
    }
}

// MARK: - Header View (Single Responsibility)
struct HeaderView: View {
    let onMenuTapped: () -> Void
    
    var body: some View {
        HStack {
            ButtonProvider(imageName: "line.horizontal.3", action: onMenuTapped)
            Spacer()
            TextProvider(labelText: AppConfig.Text.appTitle, customColor: .black)
        }
        .foregroundColor(.black)
        .padding()
    }
}

// MARK: - Profile Stack View (Single Responsibility)
struct ProfileStackView: View {
    let profiles: [ProfileModel]
    let onSwiped: (ProfileModel) -> Void
    
    var body: some View {
        ZStack {
            ForEach(profiles.reversed()) { profile in
                UserProfileView(profile: profile) {
                    onSwiped(profile)
                }
                .zIndex(Double(profiles.firstIndex(of: profile) ?? 0))
            }
        }
    }
}

// MARK: - Loading View (Single Responsibility)
struct LoadingView: View {
    var body: some View {
        VStack {
            Spacer()
            ProgressView()
                .scaleEffect(1.5)
            Text(AppConfig.Text.loadingText)
                .foregroundColor(AppConfig.Colors.secondaryText)
                .padding(.top)
            Spacer()
        }
    }
}

// MARK: - App Background View (Single Responsibility)
struct AppBackgroundView: View {
    var body: some View {
        AppConfig.Colors.background
            .edgesIgnoringSafeArea(.all)
    }
} 
