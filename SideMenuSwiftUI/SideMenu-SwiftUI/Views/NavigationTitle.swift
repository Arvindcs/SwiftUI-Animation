//
//  NavigationTitle.swift
//  SideMenu-SwiftUI
//
//  Created by Arvind on 23/11/20.
//

import SwiftUI

// MARK: - Navigation Title Component
struct NavigationTitle: View {
    let title: String
    let isMenuOpen: Bool
    
    var body: some View {
        Text(title)
            .font(.system(size: 28, weight: .bold, design: .rounded))
            .foregroundColor(.primary)
            .opacity(isMenuOpen ? 0.3 : 1.0)
            .scaleEffect(isMenuOpen ? 0.9 : 1.0)
            .animation(.spring(response: 0.4, dampingFraction: 0.8), value: isMenuOpen)
    }
}
