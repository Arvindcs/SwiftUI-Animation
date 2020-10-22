//
//  ContentView.swift
//  loadingDotAnimation
//
//  Created by Arvind on 3/2/20.
//  Copyright © 2020 Arvind. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showAnimation = false
    @State private var isOpacity = false
    
    var speed: Double = 1.6
    var heightAndWidth: CGFloat = 30
    var body: some View {
        Color.getBGColor().ignoresSafeArea()
        HStack {
            Circle()
                .fill(Color.getBallColor())
                .frame(width: heightAndWidth, height: heightAndWidth)
                .offset(x: 0, y: showAnimation ? 0 : -100)
                .animation(Animation.interpolatingSpring(stiffness: 150, damping: 5)
                            .repeatForever(autoreverses: false).delay(0.02))
            Circle()
                .fill(Color.getBallColor())
                .frame(width: heightAndWidth, height: heightAndWidth)
                .offset(x: 0, y: showAnimation ? 0 : -100)
                .animation(Animation.interpolatingSpring(stiffness: 150, damping: 5)
                            .repeatForever(autoreverses: false).delay(0.06))
            Circle()
                .fill(Color.getBallColor())
                .frame(width: heightAndWidth, height: heightAndWidth)
                .offset(x: 0, y: showAnimation ? 0 : -100)
                .animation(Animation.interpolatingSpring(stiffness: 150, damping: 5)
                            .repeatForever(autoreverses: false).delay(0.08))
            Circle()
                .fill(Color.getBallColor())
                .frame(width: heightAndWidth, height: heightAndWidth)
                .offset(x: 0, y: showAnimation ? 0 : -100)
                .animation(Animation.interpolatingSpring(stiffness: 150, damping: 5)
                            .repeatForever(autoreverses: false).delay(0.1))
            
        }.onAppear() {
            self.showAnimation.toggle()
            self.isOpacity.toggle()
        }.offset( y: -400)
        
        VStack {
            Image("profile")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40, alignment: .center)
            Text("codewithArvind").foregroundColor(.black).font(.headline)
        }
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
    func getBallColor() -> LinearGradient {
        let colors = [Color.init(red: 0.40, green: 0.49, blue: 0.92), Color.init(red: 0.46, green: 0.29, blue: 0.64)]
        return LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
    }
}

