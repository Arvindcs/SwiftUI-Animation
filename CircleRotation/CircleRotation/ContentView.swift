//
//  ContentView.swift
//  CircleRotation
//
//  Created by Arvind on 01/11/20.
//

import SwiftUI

struct ContentView: View {
    @State private var rotationDegree = 0
    @State private var isAnimation = false
    let mainCirle: CGFloat = 170
    let rotationLine: CGFloat = 190
    let capshuleWidth: CGFloat = 12
    
    var body: some View {
        ZStack {
            Circle().fill(Color.getBallColor())
                .frame(width: mainCirle, height: mainCirle)
            
            HStack(alignment: .center, spacing: 8){
                
                Capsule().fill(Color.white)
                    .frame(width: capshuleWidth, height: isAnimation ? 100 : 0)
                Capsule().fill(Color.white)
                    .frame(width: capshuleWidth, height: isAnimation ? 120 : 0)
                Capsule().fill(Color.white)
                    .frame(width: capshuleWidth, height: isAnimation ? 150 : 0)
                Capsule().fill(Color.white)
                    .frame(width: capshuleWidth, height: isAnimation ? 130 : 0)
                Capsule().fill(Color.white)
                    .frame(width: capshuleWidth, height: isAnimation ? 100 : 0)
                        
                
            }.frame(height: 100, alignment: .center)
            .animation(Animation.linear(duration: 0.5).repeatForever())
            
            Circle()
                .trim(from: 0.0, to: 1.0)
                .stroke(Color.getBallColor(), style: StrokeStyle(lineWidth: 5, lineCap: .round, dash: [30, 30], dashPhase: 40))
                .rotationEffect(.degrees(Double(rotationDegree)))
                .frame(width: rotationLine, height: rotationLine)
                .animation(Animation.linear(duration: 3).repeatForever(autoreverses: false))
        }.onAppear() {
            rotationDegree = -360
            isAnimation.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}

