//
//  ProductImage.swift
//  SideMenu-SwiftUI
//
//  Created by Arvind on 23/11/20.
//

import SwiftUI

// MARK: - Product Image Component
struct ProductImage: View {
    let imageName: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(Color(.systemGray6))
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(10)
        }
        .frame(width: 90, height: 90)
        .overlay(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(Color(.systemGray4), lineWidth: 1)
        )
    }
}
