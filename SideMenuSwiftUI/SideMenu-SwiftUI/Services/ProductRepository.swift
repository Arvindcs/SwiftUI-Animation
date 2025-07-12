//
//  ProductRepository.swift
//  SideMenu-SwiftUI
//
//  Created by Arvind on 23/11/20.
//

import Foundation

struct ProductRepository: ProductRepositoryProtocol {
    func getProducts() -> [ProductProtocol] {
        return [
            Product(
                imageName: "nike-shoes-two",
                productName: "Nike Zoom Rival Fly 2",
                productDescription: "Premium running shoes with advanced cushioning",
                price: "₹15,595"
            ),
            Product(
                imageName: "nike-shoes-three",
                productName: "Nike Zoom Rival Fly 3",
                productDescription: "Lightweight design for speed and comfort",
                price: "₹16,295"
            ),
            Product(
                imageName: "nike-shoes-four",
                productName: "Nike Zoom Rival Fly 4",
                productDescription: "Latest technology for professional athletes",
                price: "₹17,595"
            ),
            Product(
                imageName: "4",
                productName: "Nike Air Max 270",
                productDescription: "Maximum air cushioning for all-day comfort",
                price: "₹12,995"
            ),
            Product(
                imageName: "5",
                productName: "Nike React Element 55",
                productDescription: "Innovative design meets premium comfort",
                price: "₹13,495"
            )
        ]
    }
}
