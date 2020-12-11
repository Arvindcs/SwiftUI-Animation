//
//  NewPostView.swift
//  facebook-template
//
//  Created by Arvind on 10/12/20.
//

import SwiftUI

struct NewPostView: View {
    
    @State var newPosttext = ""
    
    var body: some View {
        VStack {
            HStack {
                Image("profile")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .cornerRadius(25)
                    .offset(y: 10)
                
                TextField("Write Something here?", text: $newPosttext)
                    .foregroundColor(.black)
                    .font(.custom("Avenir-Book", size: 20))
                    .offset(y: 10)
            }
        }.frame(height: 100)
        .background(Color.white)
        
        HStack(alignment: .center) {
            
            ZStack {
                Capsule().fill(Color.green.opacity(0.3))
                    .frame(width: 110, height: 30)
                
                Image("albums")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .offset(x: -44)
                
                Text("Gallary")
                    .foregroundColor(.green)
                    .font(.custom("Avenir-Medium", size: 18))
                    .offset(x: 5)
            }.offset(x: -10)
            
            Spacer()
            
            ZStack {
                Capsule().fill(Color.init(hex: "3498DB").opacity(0.3))
                    .frame(width: 110, height: 30)
                
                Image("group-icon")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .offset(x: -44)
                
                Text("People")
                    .foregroundColor(Color.init(hex: "3498DB"))
                    .font(.custom("Avenir-Medium", size: 18))
                    .offset(x: 5)
            }
            Spacer()
            
            ZStack {
                Capsule().fill(Color.init(hex: "FF7B7B").opacity(0.3))
                    .frame(width: 110, height: 30)
                
                Image("video-call")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .offset(x: -44)
                
                Text("Live")
                    .foregroundColor(Color.init(hex: "FF7B7B"))
                    .font(.custom("Avenir-Medium", size: 18))
                    .offset(x: 5)
            }.offset(x: 10)
            
        }.padding(EdgeInsets(top: 5, leading: 20, bottom: 0, trailing: 20))
    }
}
