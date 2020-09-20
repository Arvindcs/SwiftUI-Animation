//
//  ContentView.swift
//  LoadingChecKMark
//
//  Created by Arvind on 18/08/20.
//  Copyright © 2020 Arvind. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var circleBorder = false
    @State private var motionArrow = false
    @State private var opacityArrow = false
    @State private var showIcon = false
    
    var body: some View {
        ZStack {
            Color(.black)
                .scaleEffect(1)
            Circle()
                .strokeBorder(style: StrokeStyle(lineWidth: circleBorder ? 5 : 64))
                .frame(width: 128, height: 128)
                .foregroundColor(.red)
                .animation(Animation.easeOut(duration: 2)
                    .speed(1.5))
                .onAppear() {
                    self.circleBorder.toggle()
            }
            
            Image(systemName: "arrow.2.circlepath")
                .font(.title)
                .foregroundColor(.white)
                .rotationEffect(.degrees(motionArrow ? 720 : -360))
                .opacity(opacityArrow ? 0 : 1)
                .animation(Animation.easeInOut(duration: 2))
                .onAppear() {
                    
                    self.motionArrow.toggle()
                    withAnimation(Animation.easeInOut(duration: 1).delay(1)) {
                        self.opacityArrow.toggle()
                    }
            }
            
            Path { path in
                
                path.move(to: CGPoint(x: 20, y: -40))
                path.addLine(to: CGPoint(x: 20, y: -40))
                path.addLine(to: CGPoint(x: 40, y: -20))
                path.addLine(to: CGPoint(x: 80, y: -60))
            }.trim(from: 0, to: showIcon ? 1 : 0)
                .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .foregroundColor(showIcon ? .red : .white)
                .offset(x: 155, y: 450)
                .animation(Animation.interpolatingSpring(stiffness: 160, damping: 20).delay(2))
                .onAppear() {
                    self.showIcon.toggle()
            }
            
            Text("codewithArvind")
                .font(.title)
                .foregroundColor(.white)
                .font(.custom("Avanir-Bold", size: 25))
                .offset(y: -330)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
