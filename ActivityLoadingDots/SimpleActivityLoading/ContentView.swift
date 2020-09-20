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
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            Text("CodewithArvind")
                .foregroundColor(Color(.white))
                .font(.title)
                .offset(y: -300)
            
            HStack {
                AnimatedDots()
                    .foregroundColor(Color(.white))
                    .frame(width: 150, height: 100, alignment: .center)
                    .padding()
            }
            
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
