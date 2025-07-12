//
//  Product.swift
//  SideMenu-SwiftUI
//
//  Created by Arvind on 23/11/20.
//

import SwiftUI

// MARK: - Product Model
struct Product: ProductProtocol, Identifiable {
    let id = UUID()
    let imageName: String
    let productName: String
    let productDescription: String
    let price: String
}
