//
//  InstaStory.swift
//  Insta-template
//
//  Created by Arvind on 03/12/20.
//

import SwiftUI

struct InstaStory: View {
    
    var body: some View {
        ScrollView([.horizontal], showsIndicators: false) {
            HStack {
                VStack {
                    ZStack(alignment: .center) {
                        Image("my-profile-icon")
                            .resizable()
                            .frame(width: 70, height: 70)
                            .cornerRadius(35)
                        
                        Image("story-border-icon")
                            .resizable()
                            .frame(width: 80, height: 80)
                        
                        Image("Add")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .offset(x: 33, y: 23)
                    }
                    Text("Your Story")
                        .font(Font.custom("Avenir-Bold", size: 14))
                }
                
                ForEach(getUserStory()) { story in
                    StoryProvider(imageName: story.imageName, personName: story.personName)
                }
            }
        }.padding(.top, 8)
        .padding(.bottom, 8)
        .padding(.leading, -17)
        .padding(.trailing, -20)
    }
}
