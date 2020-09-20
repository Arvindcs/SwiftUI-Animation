//
//  ContentView.swift
//  LodingAnimation
//
//  Created by Arvind on 15/08/2020.
//  Copyright © 2020 Arvind. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var isCircleRotating = true
    @State private var animateStart = false
    @State private var animateEnd = true
    var body: some View {
        ZStack {
            Text("CodewithArvind").offset(y: -350)
                .font(.system(size: 18))
            Image("insta")
            Circle()
                .trim(from: animateStart ? 1/3 : 1/9,
                      to: animateEnd ? 2/5 : 1)
                .stroke(lineWidth: 7)
                .rotationEffect(
                .degrees(isCircleRotating ? 360 : 0))
                .frame(width: 150, height: 150)
                .foregroundColor(Color.blue)
                .onAppear() {
                    withAnimation(Animation
                        .linear(duration: 1)
                        .repeatForever(autoreverses: false)) {
                            self.isCircleRotating.toggle()
                    }
                    withAnimation(Animation
                        .linear(duration: 1)
                        .delay(0.5)
                        .repeatForever(autoreverses: true)) {
                            self.animateStart.toggle()
                    }
                    withAnimation(Animation
                        .linear(duration: 1)
                        .delay(1)
                        .repeatForever(autoreverses: true)) {
                            self.animateEnd.toggle()
                    }
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
