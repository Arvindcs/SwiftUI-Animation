//
//  HomeView.swift
//  Animated-SideMenu
//
//  Created by Arvind on 16/12/20.
//

import SwiftUI
import UIKit

struct SideMenu : View {
    
    @State private var buttonIndex = 0
    @State private var isToggle = false
    
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading, spacing: 20) {
                    
                    MenuButton(imageName: "briefcase", menuName: "My Travel",
                               buttonIndex: self.buttonIndex) {
                        self.buttonIndex = 0
                        withAnimation{
                            self.isToggle.toggle()
                        }
                    }
                    
                    Spacer()
                    
                    MenuButton(imageName: "briefcase", menuName: "My Travel",
                               buttonIndex: self.buttonIndex) {
                        self.buttonIndex = 1
                        withAnimation{
                            self.isToggle.toggle()
                        }
                    }
                    
                    Spacer()
                    
                    MenuButton(imageName: "briefcase", menuName: "Plans",
                               buttonIndex: self.buttonIndex) {
                        self.buttonIndex = 2
                        withAnimation{
                            self.isToggle.toggle()
                        }
                    }
                    
                    Spacer()
                    
                    MenuButton(imageName: "briefcase", menuName: "History",
                               buttonIndex: self.buttonIndex) {
                        self.buttonIndex = 3
                        withAnimation{
                            self.isToggle.toggle()
                        }
                    }
                    
                    Spacer()
                    
                    MenuButton(imageName: "briefcase", menuName: "About",
                               buttonIndex: self.buttonIndex) {
                        self.buttonIndex = 4
                        withAnimation{
                            self.isToggle.toggle()
                        }
                    }
                }.frame(height: 300)
                
                Spacer()
            }
            .padding(.top, topheight)
            .padding(.bottom, bottomheight)
            
            VStack(spacing: 0) {
                HStack(spacing: 15) {
                    Image(systemName: "line.horizontal.3")
                        .resizable()
                        .frame(width: 25, height: isToggle ? 25 : 20)
                        .rotationEffect(.degrees(isToggle ? 90 : 0))
                        .onTapGesture {
                            isToggle.toggle()
                        }
                    Spacer(minLength: 0)
                }
                .padding(.top, topheight! + CGFloat(20))
                .padding(.leading, 30)
                
                if buttonIndex == 0 {
                    HomeView()
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
            }.background(Color.white)
            .cornerRadius(25)
            .offset(x: isToggle ? UIScreen.main.bounds.width / 2 : 0, y: self.isToggle ? 200 : 0)
            .animation(Animation.linear(duration: 0.3))
        }
        .background(Color(hex: "13547a")).ignoresSafeArea()
    }
}
