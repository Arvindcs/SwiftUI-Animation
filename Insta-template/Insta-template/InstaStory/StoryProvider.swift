//
//  StoryModel.swift
//  Insta-template
//
//  Created by Arvind on 03/12/20.
//

import SwiftUI

struct StoryProvider: View {
    
    var imageName : String
    var personName : String
    
    var body: some View {
        VStack {
            ZStack {
                Image(imageName)
                    .resizable()
                    .frame(width: 70, height: 70)
                    .cornerRadius(35)
                
                Image("story-border-icon")
                    .resizable()
                    .frame(width: 80, height: 80)
                //                  .overlay(RoundedRectangle(cornerRadius: 35)
                //                  .stroke(Color.getBorderColor(), lineWidth: 3))
            }
            Text(personName)
                .font(Font.custom("Avenir-Bold", size: 14))
        }
    }
}

struct StoryModel: Identifiable {
    var id = UUID()
    var imageName : String
    var personName : String
}

func getUserStory() -> [StoryModel] {
    return [StoryModel(imageName: "image1", personName: "Elena Jose"),
            StoryModel(imageName: "image2", personName: "Emma Tem"),
            StoryModel(imageName: "image3", personName: "Sophia Kim"),
            StoryModel(imageName: "image4", personName: "Amelia Dev"),
            StoryModel(imageName: "image5", personName: "Mia Jones"),]
}
