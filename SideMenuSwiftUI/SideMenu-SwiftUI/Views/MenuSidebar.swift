//
//  MenuSidebar.swift
//  SideMenu-SwiftUI
//
//  Created by Arvind on 23/11/20.
//

import SwiftUI

// MARK: - Menu Sidebar Component (SRP)
struct MenuSidebar: View {
    let menuItems: [MenuItemProtocol]
    let selectedIndex: Int
    let onMenuItemTapped: (Int) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            UserProfile.default
                .padding(.horizontal, 24)
                .padding(.top, 32)
                .padding(.bottom, 24)
            
            Separator()
                .padding(.horizontal, 24)
            
            VStack(spacing: 8) {
                ForEach(menuItems.indices, id: \.self) { index in
                    let menuItem = menuItems[index]
                    MenuButton(
                        imageName: menuItem.iconName,
                        menuName: menuItem.title,
                        buttonIndex: selectedIndex,
                        buttonPosition: menuItem.id
                    ) {
                        onMenuItemTapped(menuItem.id)
                    }
                    .padding(.horizontal, 16)
                }
            }
            .padding(.vertical, 16)
            
            Separator()
                .padding(.horizontal, 24)
            
            MenuButton(
                imageName: "logout",
                menuName: "Logout",
                buttonIndex: selectedIndex,
                buttonPosition: -1
            ) {
                // Handle logout
            }
            .padding(.horizontal, 16)
            .padding(.top, 8)
            
            Spacer()
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(.systemIndigo).opacity(0.9),
                    Color(.systemPurple).opacity(0.8)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
    }
}
