//
//  PostView.swift
//  facebook-template
//
//  Created by Arvind on 10/12/20.
//

import SwiftUI

struct PostView : View {
    var model: StoryModel
    var body: some View {
        
        VStack {
            HStack {
                Image(model.personImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .cornerRadius(20)
                
                Text(model.personName)
                    .font(.custom("Avenir", size: 17))
                    .foregroundColor(.black)
                Spacer()
                Text("8 min")
                    .font(.custom("Avenir", size: 17))
                    .foregroundColor(.black)
                    .padding(.trailing, 8)
                
                
            }.padding(.top, 20)
            
            Image(model.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 250)
                .cornerRadius(20)
            
            HStack {
                Image("like")
                Image("love")
                Image("haha")
                
                Spacer()
                
                Text("2.5k Comment")
                    .font(.custom("Avenir", size: 16))
                    .foregroundColor(.black)
                
                Text("1.6K Shares")
                    .font(.custom("Avenir", size: 16))
                    .foregroundColor(.black)
            }
            
            HStack(alignment: .center) {
                
                Image("Like")
                Text("Like")
                    .font(.custom("Avenir-Medium", size: 16))
                
                Spacer()
                
                Image("comment")
                Text("Comment")
                    .font(.custom("Avenir-Medium", size: 16))
                
                Spacer()
                
                Image("share")
                Text("Share")
                    .font(.custom("Avenir-Medium", size: 16))
                
            }.padding(EdgeInsets(top: 5, leading: 20, bottom: 8, trailing: 20))
            
        }.frame(maxHeight: 5000)
    }
}
