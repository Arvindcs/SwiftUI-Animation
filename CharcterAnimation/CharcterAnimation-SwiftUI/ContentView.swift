//
//  ContentView.swift
//  CharcterAnimation-SwiftUI
//
//  Created by Arvind on 12/08/20.
//  Copyright © 2020 Arvind. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let characters = Array("CodeWithArvind")
    @State private var isEnable = false
    @State private var dragValue = CGSize.zero
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<characters.count) { num in
                
                Text(String(self.characters[num]))
                    .padding(6)
                    .font(.title)
                    .background(self.isEnable ?
                        Color.init(red: 0.16, green: 0.50, blue: 0.72) :
                        Color.init(red: 0.08, green: 0.62, blue: 0.52))
                    .offset(self.dragValue)
                    .animation(Animation.default.delay(Double(num) / 18))
            }
        }.gesture (
            DragGesture()
                .onChanged{ self.dragValue = $0.translation}
                .onEnded { _ in
                    self.dragValue = .zero
                    self.isEnable.toggle()
            }
        )
     }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
