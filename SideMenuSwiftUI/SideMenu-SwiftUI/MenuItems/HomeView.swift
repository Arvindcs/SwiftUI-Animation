//
//  HomeView.swift
//  SideMenu-SwiftUI
//
//  Created by Arvind on 23/11/20.
//

import SwiftUI

struct HomeView: View {
    private let productRepository: ProductRepositoryProtocol
    
    init(productRepository: ProductRepositoryProtocol = ProductRepository()) {
        self.productRepository = productRepository
    }
    
    var body: some View {
        ZStack {
            Color(.systemGray6)
                .ignoresSafeArea()
            VStack(spacing: 0) {
                List(productRepository.getProducts(), id: \.id) { product in
                    ProductRow(product: product)
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                }
                .scrollContentBackground(.hidden)
                .listStyle(PlainListStyle())
                //.padding(.top, 8)
            }
        }
    }
}
