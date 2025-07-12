//
//  MenuState.swift
//  SideMenu-SwiftUI
//
//  Created by Arvind on 23/11/20.
//

import SwiftUI

// MARK: - Menu State Management

/// Observable object that manages the state of the side menu.
/// 
/// This class follows the Single Responsibility Principle by handling
/// only menu state-related logic and animations.
final class MenuState: ObservableObject {
    // MARK: - Published Properties
    
    /// The currently selected menu item index
    @Published var selectedMenuIndex: Int = 0
    
    /// Whether the side menu is currently open
    @Published var isMenuOpen: Bool = false
    
    /// Whether the hamburger menu icon is in animated state
    @Published var isHamburgerAnimated: Bool = false
    
    // MARK: - Private Constants
    
    /// Duration for menu animation
    private static let animationDuration: Double = 0.3
    
    // MARK: - Public Methods
    
    /// Selects a menu item at the specified index and closes the menu
    /// - Parameter index: The index of the menu item to select
    func selectMenu(at index: Int) {
        selectedMenuIndex = index
        toggleMenu()
    }
    
    /// Toggles the menu open/closed state with animation
    func toggleMenu() {
        withAnimation(.easeInOut(duration: Self.animationDuration)) {
            isMenuOpen.toggle()
            isHamburgerAnimated.toggle()
        }
    }
}
