//
//  ContentView.swift
//  CircleLoadingAnimation
//
//  Created by Arvind on 30/10/20.
//

import SwiftUI

struct ContentView: View {
    @State private var rotationValue: Double = 0
    let circleHeight: CGFloat = 30
    let circleWidth: CGFloat = 30

    var body: some View {
        VStack {
            HStack {
                Circle()
                    .stroke(Color.getBallColor(), style:
                    StrokeStyle(lineWidth: 10, lineCap: .round))
                    .frame(width: circleWidth, height: circleHeight)
                Circle()
                    .stroke(Color.getBallColor(), style:
                    StrokeStyle(lineWidth: 10, lineCap: .round))
                    .frame(width: circleWidth, height: circleHeight)
                
            }.rotationEffect(.degrees(rotationValue), anchor: .center)
            HStack {
                Circle()
                    .stroke(Color.getBallColor(), style:
                    StrokeStyle(lineWidth: 10, lineCap: .round))
                    .frame(width: circleWidth, height: circleHeight)
                Circle()
                    .stroke(Color.getBallColor(), style:
                    StrokeStyle(lineWidth: 10, lineCap: .round))
                    .frame(width: circleWidth, height: circleHeight)
            }.rotationEffect(.degrees(rotationValue), anchor: .center)
            
        }.animation( Animation.linear(duration: 1).repeatForever())
        .onTapGesture {
            rotationValue = -360
        }
    }
}

extension Color {
    static
    func getBallColor() -> LinearGradient {
        let colors = [Color.init(red: 0.40, green: 0.49, blue: 0.92), Color.init(red: 0.46, green: 0.29, blue: 0.64)]
        return LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
