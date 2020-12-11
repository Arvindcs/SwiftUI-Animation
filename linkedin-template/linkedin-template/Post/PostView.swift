//
//  PostView.swift
//  linkedin-template
//
//  Created by Arvind on 05/12/20.
//

import SwiftUI

struct PostView: View {
    var postImageName: String
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading) {
                HStack {
                    Image("profile")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 48, height: 48)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading) {
                        Text("Arvind Patel")
                            .bold()
                            .foregroundColor(Color.getTextColor())
                        
                        Text("iOS Developr | Swift | Objective C | SwiftUI")
                            .font(Font.custom("Avenir-Bold", size: 13))
                            .foregroundColor(.gray)
                        
                        Text("2d . Edited 🌐")
                            .font(Font.custom("Avenir-Bold", size: 13))
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "ellipsis")
                            .font(Font.custom("Avenir-Bold", size: 20))
                            .foregroundColor(Color.getTextColor())
                    })
                }
                Text("Happy Sunday 👋 guys! Today I've redesigned Linkedin for you in SwiftUI. You will find the Source code of this project on my GitHub, go to the below link and download it. https://lnkd.in/eX4jSVP")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(Color.gray)
                    .padding(.top)
            }
            .padding()
            Image(postImageName)
                .resizable()
                .scaledToFit()
            
            HStack {
                PostLikeButton { }
                Spacer()
                
                PosrCommentButton { }
                Spacer()
                
                PostButtonProvider(imageName: "arrowshape.turn.up.right", text: "Share") {}
                Spacer()
                
                PostButtonProvider(imageName: "paperplane", text: "Send") {}
            }
            .padding()
        }
        .background(Color.gray)
        .padding([.horizontal, .bottom])
       
    }
}
