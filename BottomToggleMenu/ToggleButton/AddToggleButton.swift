//
//  AddToggleButton.swift
//  ToggleButton
//
//  Created by Arvind Patel on 25/08/20.
//  Copyright © 2020 Arvind Patel. All rights reserved.
//

import SwiftUI

struct AddToggleButton: View {
    @State var animationActive = false
    var body: some View {
        ZStack {
            VStack(alignment: .center) {
                Spacer()
                Text("codewithArvind")
                    .font(.title)
                Spacer()
                ZStack {
                    if #available(iOS 14.0, *) {
                        Color.black.ignoresSafeArea()
                    } 
                HStack() {
                Spacer()
                Circle()
                    .frame(width: 65, height: 65)
                    .foregroundColor(Color.white)
                    .overlay( Image(systemName: "play")
                        .font(.system(size: 30))
                        .foregroundColor(Color.black))
                    .blur(radius: animationActive ? -3 : 0)
                    .offset(x: animationActive ? -120 : 0, y: 0)
                    .rotationEffect(.degrees(animationActive ? 0 : 90))
                    .animation(Animation.easeIn(duration: 0.5).delay(0.5)) }
                    .padding(.trailing ,20)
                    
                    HStack() {
                        Spacer()
                        Circle()
                        .frame(width: 65, height: 65)
                        .foregroundColor(Color.white)
                        .overlay(
                            Image(systemName: "stop")
                            .font(.system(size: 30))
                            .foregroundColor(Color.black) )
                            .blur(radius: animationActive ? -3 : 0)
                            .offset(x: 0, y:animationActive ? -120 : 0)
                            .rotationEffect(.degrees(animationActive ? 0 : 90))
                            .animation(Animation.easeIn(duration: 0.5).delay(0.5))
                    }
                    .padding(.trailing ,20)
                    
                    HStack() {
                        Spacer()
                        Circle()
                            .frame(width: 65, height: 65)
                            .foregroundColor(Color.white)
                            .overlay(
                                Image(systemName: "pause")
                            .font(.system(size: 30))
                            .foregroundColor(Color.black))
                            .blur(radius: animationActive ? -3 : 0)
                            .offset(x: animationActive ? -80 : 0, y: animationActive ? -80 : 0)
                            .rotationEffect(.degrees(animationActive ? 0 : 90))
                            .animation(Animation.easeIn(duration: 0.5).delay(0.5))
                    }
                    .padding(.trailing ,20)
                    
                    HStack() {
                        Spacer()
                        Button(action: {
                            self.animationActive.toggle() }) {
                         Circle()
                            .frame(width: 65, height: 65)
                            .foregroundColor(Color.white)
                            .overlay(
                                Image(systemName:"plus")
                            .font(.system(size: 30))
                            .foregroundColor(Color.black))
                            .rotationEffect(.degrees(animationActive ? -45 : 0))
                            .animation(Animation.easeIn(duration: 0.5).delay(0.5))
                        }
                    }
                    .padding(.trailing ,20)
                }
            }
        }
        .onAppear() { }
    }
}

struct AddToggleButton_Previews: PreviewProvider {
    static var previews: some View {
        AddToggleButton()
    }
}
