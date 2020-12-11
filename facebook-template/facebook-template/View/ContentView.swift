//
//  ContentView.swift
//  facebook-template
//
//  Created by Arvind on 10/12/20.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITableView.appearance().showsVerticalScrollIndicator = false
        UITableView.appearance().tableHeaderView = UIView()
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        NavigationBar()
        
        List {
            LazyVStack {
                NewPostView().padding(.top, -10)
                StoryView()
                ForEach(getUserStory()) { post in
                    PostView(model: post)
                        .padding(.trailing ,5)
                }
            }
        }.listRowBackground(Color.clear)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
