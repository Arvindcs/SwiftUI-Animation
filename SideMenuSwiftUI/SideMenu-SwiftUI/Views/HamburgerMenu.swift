//
//  HamburgerMenu.swift
//  SideMenu-SwiftUI
//
//  Created by Arvind on 23/11/20.
//

import SwiftUI

// MARK: - Hamburger Menu Component (SRP)
struct HamburgerMenu: View {
    let isAnimated: Bool
    let action: () -> Void
    
    var body: some View {
        VStack(alignment: .center, spacing: 6) {
            Rectangle()
                .frame(width: 28, height: 3)
                .cornerRadius(1.5)
                .rotationEffect(.degrees(isAnimated ? 45 : 0), anchor: .leading)
                .foregroundColor(.primary)
                .shadow(color: Color(.systemGray4), radius: 1, x: 0, y: 1)
            
            Rectangle()
                .frame(width: 28, height: 3)
                .cornerRadius(1.5)
                .scaleEffect(isAnimated ? 0 : 1)
                .opacity(isAnimated ? 0 : 1)
                .foregroundColor(.primary)
                .shadow(color: Color(.systemGray4), radius: 1, x: 0, y: 1)
            
            Rectangle()
                .frame(width: 28, height: 3)
                .cornerRadius(1.5)
                .rotationEffect(.degrees(isAnimated ? -45 : 0), anchor: .leading)
                .foregroundColor(.primary)
                .shadow(color: Color(.systemGray4), radius: 1, x: 0, y: 1)
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemGray6))
        )
        .scaleEffect(isAnimated ? 0.9 : 1.0)
        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isAnimated)
        .onTapGesture {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                action()
            }
        }
    }
}
