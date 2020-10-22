//
//  ContentView.swift
//  DropDownMenu-Swiftui
//
//  Created by Arvind on 08.07.2020..
//  Copyright © 20202 Arvind. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State var expand = false
    
    var body : some  View {
        VStack(alignment: .leading,spacing: 25, content:  {
            HStack {
                Text("DropDown Menu").fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Image(systemName: expand ? "chevron.up" : "chevron.down")
                    .resizable().frame(width: 13, height: 6)
                    .foregroundColor(.white)
                
            }.onTapGesture {
                self.expand.toggle()
            }
            if expand {
                Button(action: {
                    self.expand.toggle()
                }) {
                    Text("Option 1")
                }.foregroundColor(.white)
                Button(action: {
                    self.expand.toggle()
                }) {
                    Text("Option 2")
                }.foregroundColor(.white)
                Button(action: {
                    self.expand.toggle()
                }) {
                    Text("Option 3")
                }.foregroundColor(.white)
            }
        }) .padding()
        .background(Color.getLinearGradient())
        .cornerRadius(5)
        .animation(.spring())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    
    static
    func getBGColor() -> Color {
        return Color(red: 224/255, green: 229/255, blue: 236/255)
    }
    
    static
    func getLinearGradient() -> LinearGradient {
        let colors = [Color.init(red: 0.40, green: 0.49, blue: 0.92), Color.init(red: 0.46, green: 0.29, blue: 0.64)]
        return LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
    }
}
