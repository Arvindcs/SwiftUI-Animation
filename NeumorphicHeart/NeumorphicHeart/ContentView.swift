//
//  ContentView.swift
//  NeumorphicHeart
//
//  Created by Arvind Patel on 28.09.2020.
//  Copyright © 2020 Arvind Patel. All rights reserved.
//
import SwiftUI

struct ContentView: View {
    @State private var animateHeart = false
    @State private var animateHeartBeat = false
    var body: some View {
        ZStack{
            Color.getBGColor().edgesIgnoringSafeArea(.all)
            ZStack {
                Text("@CodewithArvind").bold()
                    .foregroundColor(.black)
                    .frame(width: 170, height: 40)
                    .background(Color.getBGColor())
                    .shadow(color: Color.white, radius: 8, x: -8, y: -8)
                    .shadow(color: Color.getShadowColor(), radius: 8, x: 9, y: 9)
                    .offset(y: 380)
                Image("heart-Image")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 170)
                    .scaleEffect(animateHeartBeat ? 1 : 1.3)
                    .animation(Animation
                    .interpolatingSpring(stiffness: 27, damping: 10)
                                .speed(0.65)
                    .repeatForever(autoreverses: false))
                    .onAppear() { self.animateHeartBeat.toggle() }
                Image("heart-pulse")
                    .resizable()
                    .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
                    .shadow(color: Color.white, radius: 2, x: -2, y: -2)
                    .clipShape(Rectangle()
                    .offset(x: animateHeart ? 0 : -125))
                    .animation(Animation
                    .interpolatingSpring( stiffness: 27, damping: 10)
                    .speed(1.3)
                    .repeatForever(autoreverses: true)
                    .delay(0.2))
                    .offset(x: -12)
                    .onAppear() {
                        self.animateHeart.toggle()
                    }
            }
        }
    }
}

extension Color {
    static
    func getBGColor() -> Color {
        return Color(red: 224/255, green: 229/255, blue: 236/255)
    }
    
    static
    func getShadowColor() -> Color {
        return Color(red: 163/255, green: 177/255, blue: 198/255)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
/*
struct ContentView: View {
    
    @State private var bgColor = Color.yellow
    @State private var cr: CGFloat = 12
    
    var body: some View {
        ZStack {
            Color.getBGColor()
            Button(action: {
                debugPrint("Arvind")
               
            }) {
            Image("iheart-96")
            .resizable()
            .frame(width: 50, height: 50)
            .scaledToFill()
            .foregroundColor(Color(red: 166/255, green: 36/255, blue: 32/255))
            .frame(width: 100, height: 100)
            .shadow(color: Color.white, radius: 8, x: -10, y: -10)
            .shadow(color: Color.getShadowColor(), radius: 9, x: 9, y: 9)
            .padding()
            .background(Color.getBGColor())
            .cornerRadius(100)
            }
            .shadow(color: Color.white, radius: 8, x: -8, y: -8)
            .shadow(color: Color.getShadowColor(), radius: 8, x: 9, y: 9)
        }
        .edgesIgnoringSafeArea(.all)
    }
}
*/
