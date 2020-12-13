//
//  RootView.swift
//  SideMenu-SwiftUI
//
//  Created by Arvind on 23/11/20.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        VStack {
            List(getProductList()) { productObj in
                ProductRow(product: productObj)
            }
        }
    }
}
