//
//  ContentView.swift
//  AddRemoveButton
//
//  Created by Arvind on 30/12/20.
//

import SwiftUI

struct ContentView: View {
    @State private var isRotate = false
    @State private var isChangeOffset = false
    private let varicalLineWidth: CGFloat  = 10
    private let varicalLineHeight: CGFloat = 40
    private let horiLineWidth:  CGFloat = 40
    private let horiLineHeight: CGFloat = 10
    private let rotationDegree: Double  = -45
    
    var body: some View {
        ZStack() {
            Color.getBackgroundColor().edgesIgnoringSafeArea(.all)
            HStack(spacing: -2)  {
                Rectangle()
                    .frame(width: horiLineWidth, height: horiLineHeight)
                    .cornerRadius(4)
                    .foregroundColor(.white)
                    .rotationEffect(.degrees(isRotate ? rotationDegree : 0), anchor: .center)
                    .offset(x: 0, y: isChangeOffset ? 10 : 0)
                
                Rectangle()
                    .frame(width: horiLineWidth, height: horiLineHeight)
                    .cornerRadius(4)
                    .foregroundColor(.white)
                    .rotationEffect(.degrees(isRotate ? rotationDegree : 0), anchor: .center)
                    .offset(x: isChangeOffset ? -10 : 0, y: isChangeOffset ? -18 : 0)
            }
            VStack( spacing: -2) {
                Rectangle()
                    .frame(width: varicalLineWidth, height: varicalLineHeight)
                    .cornerRadius(4)
                    .foregroundColor(.white)
                    .rotationEffect(.degrees(isRotate ? rotationDegree : 0), anchor: .center)
                    .offset(x: isChangeOffset ? -20 : 0, y: isChangeOffset ? 0 : 0)
                
                Rectangle()
                    .frame(width: varicalLineWidth, height: varicalLineHeight)
                    .cornerRadius(4)
                    .foregroundColor(.white)
                    .rotationEffect(.degrees(isRotate ? rotationDegree : 0), anchor: .center)
                    .offset(x: isChangeOffset ? 10 : 0, y: isChangeOffset ? -8 : 0)
            }
        }.animation(Animation.linear(duration: 0.3))
        .frame(height: UIScreen.main.bounds.height)
         .onTapGesture {
            isRotate.toggle()
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                withAnimation(Animation.easeInOut(duration: 0.5)) {
                    isChangeOffset.toggle()
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

extension Color {
    
    static func getBackgroundColor() -> Color {
        return Color(red: 0.15, green: 0.37, blue: 1.00)
    }
}
