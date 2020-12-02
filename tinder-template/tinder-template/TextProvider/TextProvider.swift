//
//  TextProvider.swift
//  happn-dating
//
//  Created by Arvind on 01/12/20.
//

import SwiftUI

struct TextProvider: View {    
    var labelText : String
    var body: some View {
        Text(labelText)
            .font(.title)
            .fontWeight(.bold)
    }
}

struct TextWithInfinityWidth: View {
    
    var labelText : String
    var body: some View {
        Text(labelText)
            .font(.title)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}




struct ViewOffSetProvider: View {
    var offset: CGFloat
    
    var body: some View {
        if offset > 0 {
            Color.green
        } else {
            Color.red
        }
    }
}
