//
//  NavigationBar.swift
//  facebook-template
//
//  Created by Arvind on 10/12/20.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        HStack {
            Image("facebook-text")
                .resizable()
                .frame(width: 150, height: 30, alignment: .top)
                .scaledToFit()
                .padding(.leading, 10)
            
            Spacer()
            
            Button(action: {}) {
                Image("search-icon")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .scaledToFill()
            }
            
            Button(action: {}) {
                Image("notification-icon")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .scaledToFill()
            }
            
            Button(action: {}) {
                Image("group-icon")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .scaledToFill()
            }
            
            Button(action: {}) {
                Image("facebook-messenger")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .scaledToFill()
                    .padding(.trailing, 10)
            }
        }
    }
}
