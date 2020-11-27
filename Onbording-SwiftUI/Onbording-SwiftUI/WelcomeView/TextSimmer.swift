//
//  TextSimmer.swift
//  Onbording-SwiftUI
//
//  Created by Arvind on 27/11/20.
//

import SwiftUI

struct TextShimmer : View {
    @State var isAnimate = false
    var body : some View{
        
        ZStack {
            Text("Swipe To Next")
                .foregroundColor(Color.getSwipeTextColor().opacity(0.4))
                .font(.system(size: 20))
            
            Text("Swipe To Next")
                .foregroundColor(.getSwipeTextColor())
                .font(.system(size: 20))
                .mask(
                    Capsule()
                        .fill(LinearGradient(gradient: .init(colors: [.clear,Color.getTextColor(),.clear]), startPoint: .top, endPoint: .bottom))
                        .rotationEffect(.init(degrees: 25))
                        .offset(x: self.isAnimate ? 170 : -120)
                )
        }
        .onAppear {
            withAnimation(Animation.default.speed(0.15).delay(0).repeatForever(autoreverses: false)){
                self.isAnimate.toggle()
            }
        }
    }
}
