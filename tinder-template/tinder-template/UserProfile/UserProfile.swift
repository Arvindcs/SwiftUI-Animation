//
//  UserProfile.swift
//  happn-dating
//
//  Created by Arvind on 01/12/20.
//

import SwiftUI

struct UserProfile: View {
    
    @State var profile : ProfileModel
    
    let alignment1 = Alignment(horizontal: .center, vertical: .bottom)
    let alignment2 = Alignment(horizontal: .center, vertical: .center)
    
    var body: some View{
        ZStack(alignment: alignment1, content: {
            
            ImageProvider(imageName: profile.imageName)
            
            ZStack(alignment: alignment2, content: {
                ViewOffSetProvider(offset: profile.offsetValue)
                    .opacity(profile.offsetValue == 0 ? 0 : 0.6)
                let text = profile.offsetValue == 0 ? "" : (profile.offsetValue > 0 ? "LIKED" : "NOPE")
                TextProvider(labelText: text).foregroundColor(.white)
            })
            
            VStack() {
                TextWithInfinityWidth(labelText: profile.personName)
                    .foregroundColor(.white)
                   
                HStack(spacing: 35) {
                    BottomButton(imageName: "rewind_circle") {}
                    BottomButton(imageName: "dismiss_circle") {
                        withAnimation(Animation.easeIn(duration: 0.5)) {
                            profile.offsetValue = -600
                        }
                    }
                    BottomButton(imageName: "like_circle") {
                        withAnimation(Animation.easeIn(duration: 0.5)) {
                            profile.offsetValue = 600
                        }
                    }
                    BottomButton(imageName: "super_like_circle") {}
                }.frame(width: 350)
            }.padding()
        })
        .cornerRadius(22)
        .offset(x: profile.offsetValue)
        .rotationEffect(.init(degrees: profile.offsetValue == 0 ? 0 : (profile.offsetValue > 0 ? 14 : -14)))
        .gesture(DragGesture().onChanged( { (value) in withAnimation(.default) { profile.offsetValue = value.translation.width } })
                    .onEnded ({ (value) in withAnimation(.easeIn) {
                        (profile.offsetValue > 150) ? (profile.offsetValue = 600) : (profile.offsetValue < -150 ? (profile.offsetValue = -600) : (profile.offsetValue = 0))
                    }
                    })
        )
    }
}
