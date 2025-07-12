//
//  UserProfile.swift
//  SideMenu-SwiftUI
//
//  Created by Arvind on 23/11/20.
//

import SwiftUI

// MARK: - User Profile Component (SRP)
struct UserProfile: View {
    let profileImageName: String
    let greeting: String
    let userName: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Profile Image with modern styling
            Image(profileImageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.white.opacity(0.3), lineWidth: 3)
                )
            
            VStack(alignment: .leading, spacing: 4) {
                Text(greeting)
                    .font(.system(size: 16, weight: .medium, design: .rounded))
                    .foregroundColor(.white.opacity(0.8))
                
                Text(userName)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .lineLimit(1)
            }
        }
    }
}

extension UserProfile {
    static var `default`: UserProfile {
        UserProfile(
            profileImageName: "profile",
            greeting: "Welcome back",
            userName: "Arvind Patel"
        )
    }
}
