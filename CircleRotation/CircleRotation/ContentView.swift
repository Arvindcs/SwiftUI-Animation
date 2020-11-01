//
//  ContentView.swift
//  CircleRotation
//
//  Created by Arvind on 01/11/20.
//

import SwiftUI

struct ContentView: View {
    @State var isShowAnimation = false
    @State private var rotationDegree = 0.0
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.getCircleColor())
                .frame(width: mainCircle, height: mainCircle)
            HStack(alignment: .center, spacing: 8) {
                Capsule()
                    .fill(Color.white)
                    .frame(width: capsuleWidth, height: isShowAnimation ? 80 : 0)
                Capsule()
                    .fill(Color.white)
                    .frame(width: capsuleWidth, height: isShowAnimation ? 40 : 0)
                Capsule()
                    .fill(Color.white)
                    .frame(width: capsuleWidth, height: isShowAnimation ? 80 : 0)
                Capsule()
                    .fill(Color.white)
                    .frame(width: capsuleWidth, height: isShowAnimation ? 40 : 0)
                Capsule()
                    .fill(Color.white)
                    .frame(width: capsuleWidth, height: isShowAnimation ? 80 : 0)
            }
            .frame(height: 100, alignment: .center)
            .animation(Animation.linear(duration: 1).repeatForever())
            
            Circle()
                .trim(from: 0 , to: 1 )
                .stroke(Color.getCircleColor(), style:
                            StrokeStyle(lineWidth: 5, lineCap: .round, dash: [30, 30], dashPhase: 40))
                .frame(width: rotationLine, height: rotationLine)
                .rotationEffect(.degrees(rotationDegree))
                .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: false))
        }.onAppear() {
            rotationDegree = -360
            isShowAnimation.toggle()
        }
    }
    let mainCircle: CGFloat = 170
    let rotationLine: CGFloat = 190
    let capsuleWidth: CGFloat = 12
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    
    static
    func getCircleColor() -> Color {
        return Color.init(red: 0.31, green: 0.65, blue: 0.76)
    }
}
