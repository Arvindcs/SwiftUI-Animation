//
//  ContentView.swift
//  Menu-Icons
//
//  Created by Arvind on 05/09/20.
//  Copyright © 2020 Arvind. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isRotateTop = false
    @State private var isCenterLineHidden = false
    @State private var isRotateBottom = false
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 7) {
            
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(4)
                .rotationEffect(
                .degrees(isRotateTop ? 35 : 0), anchor:
                .leading)
            
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(4)
                .scaleEffect(isCenterLineHidden ? 0 : 1)
                .opacity(isCenterLineHidden ? 0 : 1)
            
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(4)
                .rotationEffect(
                .degrees(isRotateTop ? -35 : 0), anchor:
                .leading)
            
        }.animation(Animation
            .interpolatingSpring(stiffness: 100, damping: 10))
            .onTapGesture {
            self.isRotateTop.toggle()
            self.isRotateBottom.toggle()
            self.isCenterLineHidden.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
