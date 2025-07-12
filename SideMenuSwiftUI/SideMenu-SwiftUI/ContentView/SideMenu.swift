//
//  SideMenu.swift
//  SideMenu-SwiftUI
//
//  Created by Arvind on 23/11/20.
//

import SwiftUI
import UIKit

// MARK: - Main Side Menu View (SOLID Principles Applied)
struct SideMenu: View {
    @StateObject private var menuState = MenuState()
    private let menuItems = MenuConfiguration.getMenuItems()
    
    var body: some View {
        ZStack {
            // Sidebar Menu
            HStack {
                MenuSidebar(
                    menuItems: menuItems,
                    selectedIndex: menuState.selectedMenuIndex
                ) { selectedIndex in
                    menuState.selectMenu(at: selectedIndex)
                }
                
                Spacer(minLength: 0)
            }
            .padding(.top, topHeight)
            .padding(.bottom, bottomHeight)
            
            // Main Content
            MainContent(
                menuItems: menuItems,
                selectedIndex: menuState.selectedMenuIndex,
                isMenuOpen: menuState.isMenuOpen,
                isHamburgerAnimated: menuState.isHamburgerAnimated
            ) {
                menuState.toggleMenu()
            }
        }
        .background(Color.sideMenuBackgroundGradient)
        .ignoresSafeArea()
    }
}
