//
//  OptionButton.swift
//  SwiftUI-DropDown
//
//  Created by Arvind on 25/11/20.
//  Copyright © 2020 Mert Ala. All rights reserved.
//

import SwiftUI

struct OptionButton: View {
    
    var key: UUID
    var value: String
    var option : Option
    var onSelect: ((_ key: UUID, _ name: String) -> Void)?
    
    var body: some View {
        ZStack {
            Color.getLinearGradient()
            Button(action: {
                if let onSelect = self.onSelect {
                    onSelect(self.key, value)
                }
            }) {
                Text(option.optionName)
            }
        }
    }
}

struct Option: Identifiable {
    var id = UUID()
    var optionName: String
}

func getOptionList() -> [Option] {
    return [Option(optionName: "Option 1"), Option(optionName: "Option 2"), Option(optionName: "Option 3")]
}
