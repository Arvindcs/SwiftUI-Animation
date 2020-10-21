//
//  ContentView.swift
//  ChartAnimation
//
//  Created by Arvind on 20/10/20.
//  Copyright (c) 2020 Arvind. All rights reserved.

import SwiftUI

struct ContentView: View {
    @State var isShowAnimation = false
    var body: some View {
        ZStack {
            Color(.black).edgesIgnoringSafeArea(.all)
            VStack {
                HStack (spacing: 20) {
                    Chart(value: isShowAnimation ? 200 : 50)
                    Chart(value: isShowAnimation ? 250 : 150)
                    Chart(value: isShowAnimation ? 300 : 100)
                    Chart(value: isShowAnimation ? 250 : 80)
                    Chart(value: isShowAnimation ? 200 : 50)
                    Chart(value: isShowAnimation ? 300 : 100)
                    Chart(value: isShowAnimation ? 250 : 200)
                    Chart(value: isShowAnimation ? 200 : 90)
                }.padding(.top, 10)
                .offset(y: -100)
                .animation(Animation.linear(duration: 1).repeatForever())
                .onTapGesture { self.isShowAnimation.toggle()
                }
                Image("profile")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .center)
                Text("codewithArvind").foregroundColor(.white)
            }
        }
    }
}
struct Chart: View {
    var value: CGFloat = 0
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Capsule().frame(width: 25, height: 300)
                    .foregroundColor(Color(.white))
                Capsule().frame(width: 25, height: value)
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
