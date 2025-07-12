//
//  MenuItem.swift
//  SideMenu-SwiftUI
//
//  Created by Arvind on 23/11/20.
//

import SwiftUI

// MARK: - Menu Item Implementation

/// Concrete implementation of MenuItemProtocol.
/// 
/// This struct represents a menu item with all necessary properties
/// and a view builder closure to create the associated view.
struct MenuItem: MenuItemProtocol {
    /// Unique identifier for the menu item
    let id: Int
    
    /// Display title for the menu item
    let title: String
    
    /// Icon name for the menu item
    let iconName: String
    
    /// Background color for the menu item's associated view
    let backgroundColor: Color
    
    /// Private view builder closure that creates the associated view
    private let viewBuilder: () -> AnyView
    
    /// Initializes a new menu item with the specified properties
    /// - Parameters:
    ///   - id: Unique identifier for the menu item
    ///   - title: Display title for the menu item
    ///   - iconName: Icon name for the menu item
    ///   - backgroundColor: Background color for the associated view
    ///   - viewBuilder: Closure that creates the associated view
    init(id: Int, title: String, iconName: String, backgroundColor: Color, viewBuilder: @escaping () -> AnyView) {
        self.id = id
        self.title = title
        self.iconName = iconName
        self.backgroundColor = backgroundColor
        self.viewBuilder = viewBuilder
    }
    
    /// Creates and returns the view associated with this menu item
    /// - Returns: A type-erased view that will be displayed when this menu item is selected
    func createView() -> AnyView {
        return viewBuilder()
    }
}
