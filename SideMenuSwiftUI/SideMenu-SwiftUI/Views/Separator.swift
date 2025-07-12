//
//  Separator.swift
//  SideMenu-SwiftUI
//
//  Created by Arvind on 23/11/20.
//

import SwiftUI

// MARK: - Separator Component
struct Separator: View {
    var body: some View {
        Rectangle()
            .frame(height: 1)
            .foregroundColor(.white.opacity(0.2))
            .padding(.vertical, 20)
    }
}
