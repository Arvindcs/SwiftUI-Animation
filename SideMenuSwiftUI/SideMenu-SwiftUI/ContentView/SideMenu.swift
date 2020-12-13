//
//  HomeView.swift
//  SideMenu-SwiftUI
//
//  Created by Arvind on 23/11/20.
//

import SwiftUI
import UIKit

struct SideMenu : View {
    
    @State private var buttonIndex = 0
    @State private var isToggle = false
    @State private var isRotateTop = false
    @State private var isCenterLineHidden = false
    @State private var isRotateBottom = false
  
    var body: some View {
        
        ZStack {
            HStack {
                VStack(alignment: .leading, spacing: 12) {
                    Image("profile")
                        .frame(width: 130 ,height: 130)
                        .cornerRadius(65)
                    
                    Text("Hey")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 10)
                    
                    Text("Arvind Patel")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(.white)
                    
                    Separator()
                    
                    //MARK:- Home Button
                    
                    MenuButton(imageName: "home-icon", menuName: "Home",
                               buttonIndex: self.buttonIndex, buttonPosition: 0) {
                        self.buttonIndex = 0
                        withAnimation{
                            self.isToggle.toggle()
                        }
                    }
                    
                    //MARK:- My Orders Button
                    MenuButton(imageName: "order-icon", menuName: "Orders",
                               buttonIndex: self.buttonIndex, buttonPosition: 1) {
                        self.buttonIndex = 1
                        withAnimation{
                            self.isToggle.toggle()
                        }
                    }
                    
                    //MARK:- My Wishlist
                    MenuButton(imageName: "wishlist", menuName: "Wishlist",
                               buttonIndex: self.buttonIndex, buttonPosition: 2) {
                        self.buttonIndex = 2
                        withAnimation{
                            self.isToggle.toggle()
                        }
                    }
                    
                    //MARK:- Contact us
                    
                    MenuButton(imageName: "contact-icon", menuName: "About",
                               buttonIndex: self.buttonIndex, buttonPosition: 3) {
                        self.buttonIndex = 3
                        withAnimation{
                            self.isToggle.toggle()
                        }
                    }
                    
                    Separator()
                    
                    MenuButton(imageName: "logout", menuName: "Logout",
                               buttonIndex: self.buttonIndex, buttonPosition: 4) {}
                }
                .padding(.top, 22)
                .padding(.horizontal, 20)
                Spacer(minLength: 0)
            }
            .padding(.top, topheight)
            .padding(.bottom, bottomheight)
            
            
            VStack(spacing: 0) {
                HStack(spacing: 15) {
                    
                    VStack(alignment: .center, spacing: 5) {
                        
                        Rectangle()
                            .frame(width: 30, height: 4)
                            .cornerRadius(2)
                            .rotationEffect(
                                .degrees(isRotateTop ? 35 : 0), anchor: .leading)
                            .foregroundColor(Color.gray)
                        
                        Rectangle()
                            .frame(width: 30, height: 4)
                            .cornerRadius(2)
                            .scaleEffect(isCenterLineHidden ? 0 : 1)
                            .opacity(isCenterLineHidden ? 0 : 1)
                            .foregroundColor(Color.gray)
                        
                        Rectangle()
                            .frame(width: 30, height: 4)
                            .cornerRadius(2)
                            .rotationEffect(
                                .degrees(isRotateTop ? -35 : 0), anchor:.leading)
                            .foregroundColor(Color.gray)
                        
                    }.animation(Animation.linear)
                    .onTapGesture {
                        isRotateTop.toggle()
                        isRotateBottom.toggle()
                        isCenterLineHidden.toggle()
                        isToggle.toggle()
                    }
                    // Set Title
                    NavigationLabel(buttonIndex: buttonIndex)
                    Spacer(minLength: 0)
                }
                .padding(.top, topheight)
                .padding()
                
                // Menu Button Action
                didShowSelectedView(buttonIndex: buttonIndex)
            }
            .background(buttonIndex == 0 ? Color.getHomeColor() : (buttonIndex == 1 ? Color.getColor1() : (buttonIndex == 2 ? Color.getColor2() : Color.getColor3())))
            .cornerRadius(isToggle ? 25 : 0)
            .scaleEffect(isToggle ? 0.8 : 1)
            .offset(x: isToggle ? UIScreen.main.bounds.width / 2 : 0, y: self.isToggle ? 16 : 0)
            .rotationEffect(.init(degrees: self.isToggle ? -7 : 0))
            .animation(Animation.default)
        }
        .background(Color.GetSideMenuBGColor()).ignoresSafeArea()
    }
}
