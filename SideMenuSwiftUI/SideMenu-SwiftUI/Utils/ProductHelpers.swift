//
//  ProductHelpers.swift
//  SideMenu-SwiftUI
//
//  Created by Arvind on 23/11/20.
//

import Foundation

// MARK: - Legacy Support
func getProductList() -> [Product] {
    return ProductRepository().getProducts().compactMap { $0 as? Product }
}
