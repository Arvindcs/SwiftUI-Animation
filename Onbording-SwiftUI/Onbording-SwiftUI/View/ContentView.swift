//
//  ContentView.swift
//  Onbording-SwiftUI
//
//  Created by Arvind on 26/11/20.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View  {
      
        TabView {
            ForEach(0..<4) { item in
                OnbordingView(prodcut: getProductList()[item])
            }
        }.tabViewStyle(PageTabViewStyle())
        .background(Color.getBGColor().ignoresSafeArea())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
