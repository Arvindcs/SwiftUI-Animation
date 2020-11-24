//
//  RootView.swift
//  SideMenu-SwiftUI
//
//  Created by Arvind on 23/11/20.
//

import SwiftUI

struct RootView: View {
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    BannerView()
                    BannerView()
                }
            }
            
            List(getProductList()) { productObj in
                ProductRow(product: productObj)
            }
        }
    }
}
