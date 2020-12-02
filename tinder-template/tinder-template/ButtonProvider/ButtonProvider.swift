//
//  MenuButton.swift
//  SideMenu-SwiftUI
//
//  Created by Arvind on 23/11/20.
//

import SwiftUI

struct BottomButton: View {
    
    var imageName: String
    let action: () -> Void
    
    var body: some View {
        
        Button(action: action) {
            
            ZStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
            }
        }
    }
}

struct ButtonProvider: View {
    var imageName: String
    let action: () -> Void
   
    var body: some View {
        
        Button(action: action) {
            Image(systemName: imageName)
                .resizable()
                .frame(width: 25, height: 20)
        }
    }
}

struct Separator: View {
    var body: some View {
        Divider()
            .frame(width: 150, height: 1)
            .background(Color.white)
            .padding(.vertical, 30)
    }
}
