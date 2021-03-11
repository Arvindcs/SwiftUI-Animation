//
//  ContentView.swift
//  Animation
//
//  Created by Arvind on 10/03/21.
//

import SwiftUI

struct ContentView: View {
     
    @State var isAnimating: Bool = false
    let darkBlue = Color(red: 96/255, green: 174/255, blue: 201/255)
    let darkPink = Color(red: 244/255, green: 132/255, blue: 177/255)
    let darkGreen = Color(red: 137/255, green: 192/255, blue: 180/255)
    let animationDuration: Double = 1
    let maxCounter = 3
    let frame: CGSize = CGSize(width: 80, height: 80)
    
    var body: some View {
        ZStack {
            
            Color(red: 41/255, green: 42/255, blue: 48/255).ignoresSafeArea()
            ZStack {
                
                Circle().fill(darkBlue)
                    .frame(height: frame.height / 3)
                    .offset(x :0, y: isAnimating ? -frame.height / 3 : 0)
                
                Circle().fill(darkPink)
                    .frame(height: frame.height / 3)
                    .offset(x : isAnimating ? -frame.height / 3 : 0,
                            y: isAnimating ? frame.height / 3 : 0)
                
                Circle().fill(darkGreen)
                    .frame(height: frame.height / 3)
                    .offset(x : isAnimating ? frame.height / 3 : 0,
                            y: isAnimating ? frame.height / 3 : 0)
                
                
                
            }
            .animation(Animation.easeInOut(duration: animationDuration).repeatForever(autoreverses: true))
            .frame(width: frame.width, height: frame.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
            .animation(Animation.easeInOut(duration: animationDuration).repeatForever(autoreverses: false))
            .onAppear() {
                isAnimating.toggle()
            }
           
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
