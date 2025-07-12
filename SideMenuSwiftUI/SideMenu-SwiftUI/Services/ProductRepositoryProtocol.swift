//
//  ProductRepositoryProtocol.swift
//  SideMenu-SwiftUI
//
//  Created by Arvind on 23/11/20.
//

import Foundation

// MARK: - Product Repository (Dependency Inversion)
protocol ProductRepositoryProtocol {
    func getProducts() -> [ProductProtocol]
}
