//
//  ProductInfo.swift
//  SideMenu-SwiftUI
//
//  Created by Arvind on 23/11/20.
//

import SwiftUI

// MARK: - Product Info Component
struct ProductInfo: View {
    let name: String
    let description: String
    let price: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(name)
                .font(.system(size: 18, weight: .semibold, design: .rounded))
                .foregroundColor(.primary)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
            
            Text(description)
                .font(.system(size: 14, weight: .regular, design: .default))
                .foregroundColor(Color(.systemGray))
                .lineLimit(2)
                .multilineTextAlignment(.leading)
            
            HStack(alignment: .center, spacing: 12) {
                Text(price)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundColor(.blue)
                
                Spacer()
                
                // Add to cart button
                Button(action: {
                    // Handle add to cart
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 26))
                        .foregroundColor(.blue)
                        .background(Color.clear)
                }
            }
        }
    }
}
