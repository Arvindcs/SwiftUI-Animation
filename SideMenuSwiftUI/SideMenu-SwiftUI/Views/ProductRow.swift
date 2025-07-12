//
//  ProductRow.swift
//  SideMenu-SwiftUI
//
//  Created by Arvind on 23/11/20.
//

import SwiftUI

struct ProductRow: View {
    private let product: ProductProtocol
    
    init(product: ProductProtocol) {
        self.product = product
    }
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            HStack(alignment: .center, spacing: 18) {
                // Product Image
                ZStack {
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .fill(Color(.systemGray6))
                    Image(product.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(10)
                }
                .frame(width: 80, height: 80)
                .overlay(
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                )
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(product.productName)
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(.primary)
                        .lineLimit(2)
                    Text(product.productDescription)
                        .font(.system(size: 14, weight: .regular, design: .rounded))
                        .foregroundColor(Color(.systemGray))
                        .lineLimit(2)
                }
                Spacer()
            }
        }
        .padding(18)
        .background(
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .fill(Color.white)
                .shadow(color: Color(.black).opacity(0.04), radius: 12, x: 0, y: 4)
        )
        .padding(.horizontal, 8)
        .padding(.vertical, 8)
    }
}
