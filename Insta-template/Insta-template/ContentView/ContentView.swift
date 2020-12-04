//
//  ContentView.swift
//  Insta-template
//
//  Created by Arvind on 03/12/20.
//

import SwiftUI
struct ContentView: View {
    
    var body: some View {
        
        TabView {
            HomeView()
                .tabItem {
                    Image("home")
                }
            
            Text("")
                .tabItem {
                    Image("search")
                }
            
            Text("")
                .tabItem {
                    Image("photo")
                }
            
            Text("")
                .tabItem {
                    Image("activity")
                }
            
            Text("")
                .tabItem {
                    Image("profile")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
