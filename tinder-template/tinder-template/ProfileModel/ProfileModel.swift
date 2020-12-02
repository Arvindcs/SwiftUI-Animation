//
//  Product.swift
//  SideMenu-SwiftUI
//
//  Created by Arvind on 23/11/20.
//

import SwiftUI

struct ProfileModel: Identifiable {
    var id = UUID()
    var imageName: String
    var personName: String
    var offsetValue: CGFloat
}

func getProfileModels() -> [ProfileModel] {
    return [
        ProfileModel(imageName: "image1", personName: "Elena markus", offsetValue: 0),
        ProfileModel(imageName: "image2", personName: "Ana-Maria", offsetValue: 0),
        ProfileModel(imageName: "image3", personName: "Katrina", offsetValue: 0),
        ProfileModel(imageName: "image4", personName: "Emily john", offsetValue: 0),
    ]
}
