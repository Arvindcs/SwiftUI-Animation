//
//  MenuButton.swift
//  SideMenu-SwiftUI
//
//  Created by Arvind on 23/11/20.
//

import SwiftUI

struct MenuButton: View {
    
    var imageName: String
    var menuName: String
    var buttonIndex: Int
    var buttonPosition: Int
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 25){
                Image(imageName)
                    .frame(width: 18, height: 26)
                    .scaledToFit()
                    .foregroundColor(Color.white)
                Text(menuName)
                    .foregroundColor(Color.white)
            }
            .padding(.vertical, 10)
            .padding(.horizontal)
            .background(buttonIndex == buttonPosition ? Color.white.opacity(0.2) : Color.clear)
            .cornerRadius(10)
        }
    }
}

struct NavigationLabel: View {
    
    var buttonIndex: Int
    var body: some View {
        
        if (buttonIndex == 0) {
            Text("Home")
                .font(.title)
                .foregroundColor(Color.black.opacity(0.6))
        }
        
        if (buttonIndex == 1) {
            Text("Orders")
                .font(.title)
                .foregroundColor(Color.black.opacity(0.6))
        }
        
        if (buttonIndex == 2) {
            Text("WishList")
                .font(.title)
                .foregroundColor(Color.black.opacity(0.6))
        }
        
        if (buttonIndex == 3) {
            Text("About")
                .font(.title)
                .foregroundColor(Color.black.opacity(0.6))
        }
    }
}

struct didShowSelectedView: View {
    
    var buttonIndex: Int
    var body: some View {
        GeometryReader {_ in
            VStack{
                if buttonIndex == 0 {
                    RootView()
                }
                if buttonIndex == 1 {
                    Orders()
                }
                if buttonIndex == 2 {
                    Wishlist()
                }
                if buttonIndex == 3 {
                    Abouts()
                }
            }
        }
    }
}

struct ViewDivider: View {
    
    var body: some View {
        Divider()
            .frame(width: 150, height: 1)
            .background(Color.white)
            .padding(.vertical,30)

    }
}


