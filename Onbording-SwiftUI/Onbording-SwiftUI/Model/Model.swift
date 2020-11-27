//
//  Model.swift
//  Onbording-SwiftUI
//
//  Created by Arvind on 27/11/20.
//

import SwiftUI

struct Model: Identifiable {
    var id = UUID()
    var imageName: String
    var productName: String
    var productDiscription: String
}

func getProductList() -> [Model] {
    return
        [Model(imageName: "1",
                 productName: "New Videos Every Week ",
                 productDiscription: "Catch the latest videos!"),
         Model(imageName: "2",
                 productName: "Interruption-Free Playback",
                 productDiscription: "Enjoy zero-buffer, fast streaming"),
         Model(imageName: "3",
                 productName: "Seamless Viewing",
                 productDiscription: "High-quality, ad-free experience "),
         Model(imageName: "4",
                 productName: "Customised Video Quality",
                 productDiscription: "Select your video quality"),
         Model(imageName: "5",
                 productName: "Offline Videos",
                 productDiscription: "Download videos for offline viewing")
        ]
}
