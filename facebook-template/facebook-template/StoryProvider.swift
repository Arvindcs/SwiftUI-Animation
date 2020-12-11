//
//  StoryProvider.swift
//  facebook-template
//
//  Created by Arvind on 10/12/20.
//

import SwiftUI

struct StoryModel: Identifiable {
    var id = UUID()
    var imageName : String
    var personName : String
    var personImage : String
}

func getUserStory() -> [StoryModel] {
    return [StoryModel(imageName: "1", personName: "Arvind Patel", personImage: "profile"),
            StoryModel(imageName: "2", personName: "Emma Tem", personImage: "image2"),
            StoryModel(imageName: "3", personName: "Sophia Kim", personImage: "image3"),
            StoryModel(imageName: "4", personName: "Amelia Dev", personImage: "image4"),
            StoryModel(imageName: "5", personName: "Mia Jones", personImage: "image5"),]
}
