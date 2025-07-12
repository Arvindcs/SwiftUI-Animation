//
//  MenuConfiguration.swift
//  SideMenu-SwiftUI
//
//  Created by Arvind on 23/11/20.
//

import SwiftUI

// MARK: - Menu Configuration

/// Configuration struct that provides menu items for the side menu.
/// 
/// This struct follows the Open/Closed Principle by providing a centralized
/// location for menu configuration that can be extended without modification.
enum MenuConfiguration {
    // MARK: - Public Methods
    
    /// Returns an array of configured menu items
    /// - Returns: Array of menu items conforming to MenuItemProtocol
    static func getMenuItems() -> [MenuItemProtocol] {
        return [
            MenuItem(
                id: 0,
                title: "Home",
                iconName: "home-icon",
                backgroundColor: Color.homeColor,
                viewBuilder: { AnyView(HomeView()) }
            ),
            MenuItem(
                id: 1,
                title: "Orders",
                iconName: "order-icon",
                backgroundColor: Color.ordersColor,
                viewBuilder: { AnyView(Orders()) }
            ),
            MenuItem(
                id: 2,
                title: "Wishlist",
                iconName: "wishlist",
                backgroundColor: Color.wishlistColor,
                viewBuilder: { AnyView(Wishlist()) }
            ),
            MenuItem(
                id: 3,
                title: "About",
                iconName: "contact-icon",
                backgroundColor: Color.aboutColor,
                viewBuilder: { AnyView(Abouts()) }
            )
        ]
    }
}
