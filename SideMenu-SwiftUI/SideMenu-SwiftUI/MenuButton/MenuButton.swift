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

    var body: some View {
        
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

struct NavigationLabel: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .font(.title)
            .foregroundColor(Color.black.opacity(0.6))
    }
}
