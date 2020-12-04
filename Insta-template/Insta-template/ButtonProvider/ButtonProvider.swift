//
//  ButtonProvider.swift
//  Insta-template
//
//  Created by Arvind on 03/12/20.
//

import SwiftUI

struct NavigationLeftButton: View {
    
    var imageName: String
    let action: () -> Void
    
    var body: some View {
        
        Button(action: action) {
            ZStack {
                Capsule()
                    .fill(Color.getLeftButtonColor())
                    .frame(width: 80, height: 50)
                    .offset(x: -20)
                
                Image(systemName: imageName)
                    .foregroundColor(.white)
                    .offset(x: -10)
            }
        }
    }
}

struct NavigationRightButton: View {
    
    var imageName: String
    let action: () -> Void
    
    var body: some View {
        
        Button(action: action) {
            ZStack {
                Capsule()
                    .fill(Color.getRightButtonColor())
                    .frame(width: 80, height: 50)
                    .offset(x: 20)
                
                Image(systemName: imageName)
                    .foregroundColor(.white)
                    .offset(x: 10)
            }
        }
    }
}
