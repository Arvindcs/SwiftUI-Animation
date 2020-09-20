//
//  ContentView.swift
//  AnimatedLoadingWaves
//
//  Created by Arvind on 20/09/20.
//  Copyright © 2020 Arvind. All rights reserved.

import SwiftUI

struct ContentView: View {
    @State var rotateOuter = false
    @State var rotateInner = false
    var body: some View {
        ZStack {
            
            Color.black.ignoresSafeArea()
            Image("large-waves")
                .resizable()
                .scaledToFit()
                .frame(width: 100.0, height: 100.0)
                .foregroundColor(.white)
                .rotationEffect(.degrees(rotateInner ? -180 : 0))
                .animation(Animation.easeInOut(duration: 1)
                .repeatForever(autoreverses: true))
                .onAppear() {
                    self.rotateOuter.toggle()
                }
            Image("small-waves")
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .scaledToFit()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
                .rotationEffect(.degrees(rotateInner ? 180 : 0))
                .animation(Animation.easeOut(duration: 1)
                .repeatForever(autoreverses: true))
                .onAppear(){
                    self.rotateInner.toggle()
                }
            Text("@codewithArvind")
                .font(.title2)
                .background(Color.black)
                .foregroundColor(.white)
                .offset( y: -350)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
