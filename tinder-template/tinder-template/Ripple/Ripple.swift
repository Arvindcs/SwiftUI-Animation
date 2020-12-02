//
//  Ripple.swift
//  happn-dating
//
//  Created by Arvind on 01/12/20.
//

import SwiftUI

struct Ripple: View {
    
    @State private var animating = true
    
    var body: some View {
        ZStack {
                       
            Circle()
                .stroke(lineWidth: 7)
                .fill(Color.gray.opacity(0.2))
                .frame(width: animating ? 100 : 500, height: animating ? 100 : 500)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                .blur(radius: 5)
                .opacity(animating ? 1 : 0)
            
            Circle()
                .stroke(lineWidth: 7)
                .fill(Color.gray.opacity(0.2))
                .frame(width: animating ? 0 : 400, height: animating ? 0 : 400)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                .blur(radius: 5)
                .opacity(animating ? 1 : 0)
            
            ProfileImageProvider().offset(y: 20)
            
        }.frame(width: 390, height: 750, alignment: .center)
        .onAppear() {
            withAnimation(Animation.easeInOut(duration: 2.5).repeatForever(autoreverses: false)) {
                self.animating.toggle()
            }
        }
    }
}
