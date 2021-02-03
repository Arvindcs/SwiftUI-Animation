//
//  ContentView.swift
//  ColorChanges
//
//  Created by Arvind on 01/02/21.
//

import SwiftUI

struct ContentView: View {
    var colors: [Color] = [Constant.darkBlue, Constant.darkPink, Constant.darkViolet, Constant.darkGreen, Constant.darkGray]
    @State var index: Int = 0
    
    var body: some View {
        VStack {
            SplashView(color: self.colors[self.index])
                .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height - 80, alignment: .center)
                .cornerRadius(10)
                .onTapGesture {
                    withAnimation(Animation.linear.repeatForever(autoreverses: false)) {
                        self.index = (self.index + 1) % self.colors.count
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
