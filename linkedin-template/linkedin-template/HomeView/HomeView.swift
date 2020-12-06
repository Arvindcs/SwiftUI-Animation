//
//  HomeView.swift
//  linkedin-template
//
//  Created by Arvind on 05/12/20.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            VStack {
                SearchView()
                ScrollView(.vertical, showsIndicators: false) {
                    LinkedinStory()
                   
                    
                    ForEach(getUserPost()) { post in
                        PostView(postImageName: post.imageName)
                    }.padding(.top)
                    Spacer(minLength: 70)
                }
            }
        }
    }
}
