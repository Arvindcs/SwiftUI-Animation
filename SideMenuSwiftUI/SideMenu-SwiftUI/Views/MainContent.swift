//
//  MainContent.swift
//  SideMenu-SwiftUI
//
//  Created by Arvind on 23/11/20.
//

import SwiftUI
import UIKit

// MARK: - Main Content Component (SRP)
struct MainContent: View {
    let menuItems: [MenuItemProtocol]
    let selectedIndex: Int
    let isMenuOpen: Bool
    let isHamburgerAnimated: Bool
    let onHamburgerTapped: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack(spacing: 16) {
                HamburgerMenu(isAnimated: isHamburgerAnimated) {
                    onHamburgerTapped()
                }
                
                NavigationTitle(
                    title: getCurrentMenuTitle(),
                    isMenuOpen: isMenuOpen
                )
                
                Spacer(minLength: 0)
            }
            .padding(.top, topHeight)
            .padding(.horizontal, 20)
            .padding(.bottom, 16)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
            )
            
            // Content Area
            getCurrentView()
                .padding(.top, 8)
        }
        .background(getCurrentBackgroundColor())
        .cornerRadius(isMenuOpen ? 30 : 0, corners: [.topLeft, .bottomLeft])
        .scaleEffect(isMenuOpen ? 0.85 : 1)
        .offset(x: isMenuOpen ? UIScreen.main.bounds.width / 2.2 : 0, y: isMenuOpen ? 20 : 0)
        .rotationEffect(.degrees(isMenuOpen ? -8 : 0))
        .animation(.spring(response: 0.6, dampingFraction: 0.8), value: isMenuOpen)
    }
    
    private func getCurrentMenuTitle() -> String {
        guard selectedIndex < menuItems.count else { return "Home" }
        return menuItems[selectedIndex].title
    }
    
    private func getCurrentView() -> AnyView {
        guard selectedIndex < menuItems.count else { return AnyView(HomeView()) }
        return menuItems[selectedIndex].createView()
    }
    
    private func getCurrentBackgroundColor() -> Color {
        guard selectedIndex < menuItems.count else { return Color.getHomeColor() }
        return menuItems[selectedIndex].backgroundColor
    }
}

// MARK: - Corner Radius Extension
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
