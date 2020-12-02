//
//  ImageProvider.swift
//  happn-dating
//
//  Created by Arvind on 01/12/20.
//

import SwiftUI

struct ImageProvider: View {
    
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 390,height: 750)
    }
}

struct ProfileImageProvider: View {
    
    var body: some View {
        
        VStack {
            Image("profile")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80,height: 80)
                .cornerRadius(40)
            
            Text("Finding people near you")
                .font(.subheadline)
                .font(.system(size: 8))
                .foregroundColor(.gray)
            }
    }
}
