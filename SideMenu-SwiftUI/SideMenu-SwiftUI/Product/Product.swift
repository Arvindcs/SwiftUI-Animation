//
//  Product.swift
//  SideMenu-SwiftUI
//
//  Created by Arvind on 23/11/20.
//

import SwiftUI

struct Product: View {
    
    var imageName: String
    var productName: String
    var productDiscription: String
    
    var body: some View {
    
        HStack(spacing: 15) {
            Image(imageName)
                .resizable()
                .frame(width: 150, height: 130)
            
            
            VStack(alignment: .leading, spacing: 12) {
                
                Text(productName)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Text(productDiscription)
                    .foregroundColor(.secondary)
            }
            
            Spacer(minLength: 0)
        }.background((UIImage(named: imageName)?
        .getPixelColor(pos: CGPoint(x: 5, y: 5))))
        .cornerRadius(15)
    }
}
