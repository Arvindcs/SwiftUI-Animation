//
//  StoryView.swift
//  facebook-template
//
//  Created by Arvind on 10/12/20.
//

import SwiftUI

struct StoryView : View {
    
    var body: some View {
        
        ScrollView([.horizontal], showsIndicators: false) {
            HStack {
                ForEach(getUserStory()) { story in
                    StoryViewRow(model: story)
                        .padding(.trailing ,5)
                }
            }
        }.frame(height: 240).offset(y: -20)
    }
}

struct StoryViewRow: View {
    var model: StoryModel
    var body: some View {
        ZStack(alignment: .top) {
            Image(model.imageName)
                .resizable()
                .frame(width: 110, height: 150)
                .cornerRadius(30)
            
            Image(model.personImage)
                .resizable()
                .frame(width: 40, height: 40)
                .addBorder(Color.white, width: 4, cornerRadius: 20)
                .offset(y: 150)
                
            Text(model.personName)
                .offset(y: 180)
                .padding()
            
        }.frame(height: 280)
    }
}

extension View {
    public func addBorder<S>(_ content: S, width: CGFloat = 1, cornerRadius: CGFloat) -> some View where S : ShapeStyle {
        let roundedRect = RoundedRectangle(cornerRadius: cornerRadius)
        return clipShape(roundedRect)
             .overlay(roundedRect.strokeBorder(content, lineWidth: width))
    }
}
