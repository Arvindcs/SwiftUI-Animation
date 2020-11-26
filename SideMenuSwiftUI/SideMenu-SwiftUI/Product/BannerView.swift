//
//  BannerView.swift
//  SideMenu-SwiftUI
//
//  Created by Arvind on 24/11/20.
//

import SwiftUI

struct BannerView: View {
    
    //var product: Product
    
    var body: some View {
    
        ZStack(alignment: .bottomTrailing) {
            VStack(spacing: 10) {
                Image("nike-shoes-one")
                    .resizable()
                    .frame(height: 185)
                
                Text("Nike Air Zoom Tempo Next FlyEase")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Price - ₹17,595")
                    .foregroundColor(.white)
            }
            .frame(width: 400, height: 300, alignment: .center)
            .background(Color.getBGColor())
            .cornerRadius(15)
            .padding()
            
            Button(action: {
                print("Arvind")
            }) {
                Image("bag-icon")
                    .foregroundColor(Color.white)
                    .padding()
                    .background(Color.getBagBGColor())
                    .cornerRadius(15)
            }.padding(.trailing)
        }
    }
}
