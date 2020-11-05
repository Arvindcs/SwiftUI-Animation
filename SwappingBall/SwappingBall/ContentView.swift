//
//  ContentView.swift
//  SwappingBall
//
//  Created by Arvind on 22/10/20.
//  Copyright (c) 2020 Arvind. All rights reserved.

import SwiftUI

struct ContentView: View {
    @State private var isBallSwaping = false
    
    var body: some View {
       // Color.getBGColor()
        ZStack {
            HStack {
                Circle()
                    .fill(Color.getFirstBallColor())
                    .frame(width: 30, height: 30)
                Circle()
                    .fill(Color.getFirstBallColor())
                    .frame(width: 30, height: 30)
                   
            } .offset(x: CGFloat(40),y: isBallSwaping ? -40 : 0)
            HStack {
                Circle()
                    .fill(Color.getSecondBallColor())
                    .frame(width: 30, height: 30)
                Circle()
                    .fill(Color.getSecondBallColor())
                    .frame(width: 30, height: 30)
                    
         }.offset(x: CGFloat(40),y: isBallSwaping ? 40 : 0)
        }.frame(width: 320, height: 60, alignment: .center)
        .offset(x: -35)
        .animation(Animation.linear(duration: 1).repeatForever())
        .onAppear() {
            isBallSwaping.toggle()
        }
        VStack {
            Image("profile")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40, alignment: .center)
            Text("codewithArvind").foregroundColor(.black).font(.headline)
        }.offset(y: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    
    static
    func getBGColor() -> Color {
        return Color(red: 224/255, green: 229/255, blue: 236/255)
    }
        
    static
    func getFirstBallColor() -> LinearGradient {
        let colors = [Color.init(red: 0.40, green: 0.49, blue: 0.92), Color.init(red: 0.46, green: 0.29, blue: 0.64)]
        return LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
    }

    static
    func getSecondBallColor() -> LinearGradient {
        let colors = [Color.init(red: 0.84, green: 0.43, blue: 0.46), Color.init(red: 0.46, green: 0.29, blue: 0.64)]
        return LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
    }
}

