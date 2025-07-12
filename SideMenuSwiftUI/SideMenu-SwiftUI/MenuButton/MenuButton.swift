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
            HStack(spacing: 16) {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .foregroundColor(buttonIndex == buttonPosition ? .white : .white.opacity(0.8))
                    .animation(.easeInOut(duration: 0.2), value: buttonIndex)
                
                Text(menuName)
                    .font(.system(size: 16, weight: .medium, design: .rounded))
                    .foregroundColor(buttonIndex == buttonPosition ? .white : .white.opacity(0.8))
                    .animation(.easeInOut(duration: 0.2), value: buttonIndex)
                
                Spacer()
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(buttonIndex == buttonPosition ? 
                          Color.white.opacity(0.25) : Color.clear)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(buttonIndex == buttonPosition ? 
                                   Color.white.opacity(0.3) : Color.clear, lineWidth: 1)
                    )
            )
            .scaleEffect(buttonIndex == buttonPosition ? 1.02 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.7), value: buttonIndex)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
