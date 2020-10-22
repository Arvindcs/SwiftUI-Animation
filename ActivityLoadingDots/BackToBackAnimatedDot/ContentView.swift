//
//  ContentView.swift
//  SimpleActivityLoading
//
//  Created by Arvind on 10/09/20.
//  Copyright © 2020 Arvind. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.getBGColor()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("profile")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .center)
                Text("codewithArvind").foregroundColor(.black).font(.headline)
            }.offset(y: 350)
            
            HStack {
                AnimatedDots()
                    .frame(width: 120, height: 100, alignment: .center)
                    .padding()
            }
        }
    }
}

extension Color {
    
    static
    func getBGColor() -> Color {
        return Color(red: 224/255, green: 229/255, blue: 236/255)
    }
    
    static
    func getSecondBallColor() -> LinearGradient {
        let colors = [Color.init(red: 0.84, green: 0.43, blue: 0.46), Color.init(red: 0.46, green: 0.29, blue: 0.64)]
        return LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
