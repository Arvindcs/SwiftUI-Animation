//
//  MapView.swift
//  Animated-SideMenu
//
//  Created by Arvind on 16/12/20.
//

import SwiftUI

struct HomeView: View {
    
    @State var isSelectSegment = false
    @State var isSelectedIndex = 0
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Hello,")
                            .font(.system(size: 25, weight: .medium))
                            .foregroundColor(.gray)
                        Text("Arvind Patel")
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(Color(hex: "2f2f2f"))
                            
                    }
                    .padding(.leading, 30)
                    Spacer()
                    Image("profile")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .cornerRadius(30)
                        .padding(.trailing, 30)
                    
                }.padding(.top, 40)
   
                VStack(alignment: .leading) {
                    Text("Lets choose your Language To learn")
                        .font(.system(size: 17))
                        .foregroundColor(Color.gray)
                    HStack {
                        
                        //TODO:- Personal Button
                        Button(action: {
                            isSelectSegment.toggle()
                        }) {
                            Text("Swift")
                                .foregroundColor(isSelectSegment ? Color(#colorLiteral(red: 0.1333333333, green: 0.1333333333, blue: 0.1333333333, alpha: 1)) : .white)
                                .font(.system(size: 19))
                        }
                        .frame(width: 180, height: 54)
                        .background(isSelectSegment ? .white : Color(hex: "6E4BD8"))
                        .cornerRadius(14)
                        
                        //TODO:- Business Button
                        Button(action: {
                            isSelectSegment.toggle()
                        }) {
                            Text("Objective C")
                                .foregroundColor(isSelectSegment ? .white : Color(#colorLiteral(red: 0.1333333333, green: 0.1333333333, blue: 0.1333333333, alpha: 1)))
                                .font(.system(size: 19))
                        }
                        .frame(width: 180, height: 54)
                        .background(isSelectSegment ? Color(hex: "6E4BD8") : .white)
                        .cornerRadius(14)
                    }
                    .padding(.top, 40)
                    
                }.padding(.top, 20)
                
                VStack(alignment: .leading) {
                    Text("Select Topic")
                        .font(.system(size: 28, weight: .medium))
                        .foregroundColor(Color(#colorLiteral(red: 0.1333333333, green: 0.1333333333, blue: 0.1333333333, alpha: 1))).padding(.leading, 20)
                    
                    VStack {
                        HStack (spacing: 10) {
                            Button(action: {
                                isSelectedIndex = 0
                            }) {
                                VStack {
                                    Image("delegate")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                    
                                    Text("Delegate")
                                        .font(.system(size: 19, weight: .medium))
                                        .offset(y: 20)
                                }
                                .frame(width: 180, height: 200)
                                .background(isSelectedIndex == 0 ? Color(hex: "E55238") : Color.white)
                                .cornerRadius(20)
                            }.foregroundColor(isSelectedIndex == 0 ? Color.white : Color.black)
                            
                            Button(action: {
                                isSelectedIndex = 1
                            }) {
                                VStack {
                                    Image("protocol")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                    
                                    Text("Protocol")
                                        .font(.system(size: 19, weight: .medium, design: .default))
                                        .offset(y: 20)
                                    
                                }
                                .frame(width: 180, height: 200)
                                .background(isSelectedIndex == 1 ? Color(hex: "E55238") : Color.white)
                                .cornerRadius(20)
                            }.foregroundColor(isSelectedIndex == 1 ? Color.white : Color.black)
                        }
                        .padding()
                        
                        HStack (spacing: 10) {
                            
                            Button(action: {
                                isSelectedIndex = 2
                            }) {
                                VStack {
                                    Image("closuress")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                    Text("Closure")
                                        .font(.system(size: 19, weight: .medium, design: .default))
                                        .offset(y: 20)
                                }
                                .frame(width: 180, height: 200)
                                .background(isSelectedIndex == 2 ? Color(hex: "E55238") : Color.white)
                                .cornerRadius(20)
                            }.foregroundColor(isSelectedIndex == 2 ? Color.white : Color.black)
                            
                            Button(action: {
                                isSelectedIndex = 3
                            }) {
                                VStack {
                                    Image("api")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                    Text("API's")
                                        .font(.system(size: 19, weight: .medium, design: .default))
                                        .offset(y: 20)
                                }
                                .frame(width: 180, height: 200)
                                .background(isSelectedIndex == 3 ? Color(hex: "E55238") : Color.white)
                                .cornerRadius(20)
                            }.foregroundColor(isSelectedIndex == 3 ? Color.white : Color.black)
                        }
                    }
                }
                .padding(.top, 20)
                Spacer()
            }
        }
    }
}

