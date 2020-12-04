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
    
    @State private var pickerSelectedItem = 0
    @State private var dataPoints: [[CGFloat]] = [
        [100, 120, 150],
        [150, 100, 120],
        [120, 150, 100],
        [150, 100, 120],
        [100, 120, 150],
    ]
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.getCircleColor())
                .frame(width: mainCircle, height: mainCircle)
           
            HStack(alignment: .center, spacing: 8) {
                Capsule()
                    .fill(Color.white)
                    .frame(width: capsuleWidth, height: dataPoints[pickerSelectedItem][0])
                Capsule()
                    .fill(Color.white)
                    .frame(width: capsuleWidth, height: dataPoints[pickerSelectedItem][1])
                Capsule()
                    .fill(Color.white)
                    .frame(width: capsuleWidth, height: dataPoints[pickerSelectedItem][2])
                Capsule()
                    .fill(Color.white)
                    .frame(width: capsuleWidth, height: dataPoints[pickerSelectedItem][1])
                Capsule()
                    .fill(Color.white)
                    .frame(width: capsuleWidth, height: dataPoints[pickerSelectedItem][0])
            }
            .frame(height: 100, alignment: .center)
            .animation(Animation.linear(duration: 0.5).repeatForever())
            
            Circle()
                .trim(from: 0 , to: 1 )
                .stroke(Color.getCircleColor(), style:
                            StrokeStyle(lineWidth: 5, lineCap: .round,
                            dash: [30, 30], dashPhase: 40))
                
                .frame(width: rotationLine, height: rotationLine)
                .rotationEffect(.degrees(rotationDegree))
                .animation(Animation.linear(duration: 3)
                .repeatForever(autoreverses: false))
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

