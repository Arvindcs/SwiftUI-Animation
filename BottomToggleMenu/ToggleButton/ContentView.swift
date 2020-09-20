//
//  ContentView.swift
//  ToggleButton
//
//  Created by Arvind Patel on 25/08/20.
//  Copyright © 2020 Arvind Patel. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                AddToggleButton()
            }
            .navigationBarTitle(Text("Arvind"), displayMode: .inline)
            .edgesIgnoringSafeArea(.top)
            .navigationBarHidden(false)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
