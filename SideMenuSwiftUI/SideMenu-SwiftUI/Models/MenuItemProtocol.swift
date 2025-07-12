//
//  MenuItemProtocol.swift
//  SideMenu-SwiftUI
//
//  Created by Arvind on 23/11/20.
//

import SwiftUI

// MARK: - Menu Item Protocol

/// Protocol defining the interface for menu items in the side menu.
/// 
/// This protocol follows the Interface Segregation Principle by providing
/// only the essential properties and methods needed for menu item representation.
protocol MenuItemProtocol {
    /// Unique identifier for the menu item
    var id: Int { get }
    
    /// Display title for the menu item
    var title: String { get }
    
    /// Icon name for the menu item
    var iconName: String { get }
    
    /// Background color for the menu item's associated view
    var backgroundColor: Color { get }
    
    /// Creates and returns the view associated with this menu item
    /// - Returns: A type-erased view that will be displayed when this menu item is selected
    func createView() -> AnyView
}
