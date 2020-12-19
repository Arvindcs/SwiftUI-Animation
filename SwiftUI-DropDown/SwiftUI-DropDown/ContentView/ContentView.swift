//
//  ContentView.swift
//  DropDownMenu-Swiftui
//
//  Created by Arvind on 08.07.2020..
//  Copyright © 20202 Arvind. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State var isExpandDropDown = false
    @State var selectedOption = "Option 1"
    
    var body : some  View {
        VStack(alignment: .center, spacing: 25, content:{
            HStack {
                Text(selectedOption).fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Image(systemName: isExpandDropDown ?
                        "chevron.up" : "chevron.down")
                    .resizable().frame(width: 13, height: 6)
                    .foregroundColor(.white)
                
            }.onTapGesture {
                isExpandDropDown.toggle()
            }
            
            if isExpandDropDown { // TODO:- //getOptionList is your model array 
                List(getOptionList()) { option in
                    OptionButton(key: option.id,
                                 value: option.optionName,
                                 option: option) {
                        (identifier, selectedName)  in
                        selectedOption = selectedName
                        isExpandDropDown.toggle()
                    }.background(Color.red)
                }
            }
        }) .padding()
        .frame(width: 150, height: isExpandDropDown ?
                CGFloat(getOptionList().count * 60 + 40) : 40)
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
