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
            
            Image(systemName: "video.fill")
                .foregroundColor(Color.red)
                .font(.system(size: 16))
            
            Text("Live")
                .font(.custom("Avenir-Book", size: 16))
            
            Spacer()
            
            Image(systemName: "photo.fill")
                .foregroundColor(Color.green)
                .font(.system(size: 16))
            
            Text("Photo")
                .font(.custom("Avenir-Book", size: 16))
            
            Spacer()
            
            Image(systemName: "location.fill")
                .foregroundColor(Color.purple)
                .font(.system(size: 16))
            
            Text("Location")
                .font(.custom("Avenir-Book", size: 16))
            
        }.padding(EdgeInsets(top: 5, leading: 20, bottom: 0, trailing: 20))
    }
}
