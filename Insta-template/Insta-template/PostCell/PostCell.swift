//
//  PostCell.swift
//  Insta-template
//
//  Created by Arvind on 03/12/20.
//

import SwiftUI

struct InstaPostCell: View {
    
    var imageName: String
    var userName: String
    
    var body: some View {
    
        VStack(alignment: .leading) {
            
            HStack {
                Image(imageName)
                    .resizable()
                    .frame(width: 35, height: 35)
                    .cornerRadius(17.5)
                
                Text(userName)
                    .font(Font.custom("Avenir-Bold", size: 15))
                
                Spacer()
                Image("more-icon")
                    .padding(.trailing, 16)
                
            }.padding(.top, 8)
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(20)
            
            HStack(alignment: .center, spacing: 16) {
                Image("like-fill")
                Image("comment-icon")
                Image("send-icon")
                
                Spacer()
                Image("save-icon")
            }.padding()
        }
    }
}
