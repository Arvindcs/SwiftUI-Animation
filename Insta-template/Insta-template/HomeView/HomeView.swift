//
//  HomeView.swift
//  Insta-template
//
//  Created by Arvind on 03/12/20.
//

import SwiftUI

struct HomeView: View {
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().backgroundColor = .white
        UITableView.appearance().backgroundColor = .white
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    var body: some View {
        VStack {
            HStack {
                NavigationLeftButton(imageName: "camera.fill") { }
                Spacer()
                Image("Instagram")
                    .resizable()
                    .frame(width: 150, height: 40, alignment: .center)
                    .offset(y: 8)
                
                Spacer()
                NavigationRightButton(imageName: "paperplane.fill") { }
            }
            
            List {
                InstaStory()
                ForEach(getUserStory()) { post in
                    InstaPostCell(imageName: post.imageName, userName: post.personName)
                }
            }
        }
    }
}
