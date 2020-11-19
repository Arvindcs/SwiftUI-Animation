//
//  WidgetView.swift
//  WidgetApp
//
//  Created by Arvind on 18/11/20.
//

import SwiftUI
import WidgetKit

struct WidgetView: View {
    
    private var simpleEntry: UIImage
    
    init(_entry: UIImage) {
        self.simpleEntry = _entry
    }
    
    var body: some View {
        Image(uiImage: self.simpleEntry)
            .resizable()
            .scaledToFill()
    }
}

struct WidgetView_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView(_entry: UIImage(named: "test")!)
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
