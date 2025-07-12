//
//  ProductProtocol.swift
//  SideMenu-SwiftUI
//
//  Created by Arvind on 23/11/20.
//

import SwiftUI

// MARK: - Product Protocol (Interface Segregation)
protocol ProductProtocol {
    var id: UUID { get }
    var imageName: String { get }
    var productName: String { get }
    var productDescription: String { get }
    var price: String { get }
}
