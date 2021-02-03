//
//  SplashView.swift
//  ColorChanges
//
//  Created by Arvind on 01/02/21.
//

import SwiftUI

struct SplashView: View {
    
    @State private var prevColor: Color
    @ObservedObject var colorStore: ColorStore
    
    @State var layers: [(Color,CGFloat)] = []

    
    init(color: Color) {

        self._prevColor = State<Color>(initialValue: color)
        self.colorStore = ColorStore(color: color)
    }
    
    var body: some View {
        Rectangle()
            .foregroundColor(self.prevColor)
            .overlay(
                ZStack {
                    ForEach(layers.indices, id: \.self) { x in
                        SplashShape(progress: self.layers[x].1)
                            .foregroundColor(self.layers[x].0)
                    }
                }
                
                , alignment: .leading)
            .onReceive(self.colorStore.$color) { color in
                self.layers.append((color, 0))
                
                withAnimation(.easeInOut(duration: 0.5)) {
                    self.layers[self.layers.count-1].1 = 1.0
                }
            }
    }
}


class ColorStore: ObservableObject {
    @Published var color: Color
    
    init(color: Color) {
        self.color = color
    }
}
