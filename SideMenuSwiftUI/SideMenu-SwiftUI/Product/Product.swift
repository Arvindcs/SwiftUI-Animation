//
//  Product.swift
//  SideMenu-SwiftUI
//
//  Created by Arvind on 23/11/20.
//

import SwiftUI

struct ProductRow: View {
    var product: Product
    var body: some View {
        HStack(spacing: 15) {
            Image(product.imageName)
                .resizable()
                .frame(width: 150, height: 130)
            
            VStack(alignment: .leading, spacing: 12) {
                
                Text(product.productName)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Text(product.productDiscription)
                    .foregroundColor(.secondary)
            }
            Spacer(minLength: 0)
        }.background((UIImage(named: product.imageName)?
        .getPixelColor(pos: CGPoint(x: 5, y: 5))))
        .cornerRadius(15)
    }
}

struct Product: Identifiable {
    var id = UUID()
    var imageName: String
    var productName: String
    var productDiscription: String
}

func getProductList() -> [Product] {
    
    return
        [Product(imageName: "nike-shoes-two",
                 productName: "Nike Zoom Rival Fly 2",
                 productDiscription: "Price - ₹15,595"),
         Product(imageName: "nike-shoes-three",
                 productName: "Nike Zoom Rival Fly 3",
                 productDiscription: "Price - ₹15,595"),
         Product(imageName: "nike-shoes-four",
                 productName: "Nike Zoom Rival Fly 4",
                 productDiscription: "Price - ₹15,595"),
         
         Product(imageName: "nike-shoes-three",
                 productName: "Nike Zoom Rival Fly 4",
                 productDiscription: "Price - ₹15,595")
         ,
         Product(imageName: "4",
                 productName: "Nike Zoom Rival Fly 4",
                 productDiscription: "Price - ₹15,595")
         ,
         Product(imageName: "5",
                 productName: "Nike Zoom Rival Fly 4",
                 productDiscription: "Price - ₹15,595")
         ,
         Product(imageName: "nike-shoes-four",
                 productName: "Nike Zoom Rival Fly 4",
                 productDiscription: "Price - ₹15,595")
         
         ,
         Product(imageName: "nike-shoes-two",
                 productName: "Nike Zoom Rival Fly 4",
                 productDiscription: "Price - ₹15,595")
        ]
}
