//
//  ContentView.swift
//  SwiftUI-ScrollView
//
//  Created by Arvind Patel on 31/07/2020.
//  Copyright © 2020 Arvind Patel. All rights reserved.
//

import SwiftUI

extension Font {
    static func avenirNext(size: Int) -> Font {
        return Font.custom("Avenir Next", size: CGFloat(size))
    }
    
    static func avenirNextRegular(size: Int) -> Font {
        return Font.custom("AvenirNext-Regular", size: CGFloat(size))
    }
}

struct ContentView: View {
    private let imageHeight: CGFloat = 290
    private let collapsedImageHeight: CGFloat = 70
    
    @ObservedObject private var articleContent: ViewFrame = ViewFrame()
    @State private var titleRect: CGRect = .zero
    @State private var headerImageRect: CGRect = .zero
    
    func getScrollOffset(_ geometry: GeometryProxy) -> CGFloat {
        geometry.frame(in: .global).minY
    }
    
    func getOffsetForTopImage(_ geometry: GeometryProxy) -> CGFloat {
        let offset = getScrollOffset(geometry)
        let sizeOffScreen = imageHeight - collapsedImageHeight
        
        if offset < -sizeOffScreen {
            let imageOffset = abs(min(-sizeOffScreen, offset))
            return imageOffset - sizeOffScreen
        }
        if offset > 0 {
            return -offset
        }
        return 0
    }
    
    func getHeightForHeaderImage(_ geometry: GeometryProxy) -> CGFloat {
        let offset = getScrollOffset(geometry)
        let imageHeight = geometry.size.height
        
        if offset > 0 {
            return imageHeight + offset
        }
        
        return imageHeight
    }
    
    func getBlurRadiusForImage(_ geometry: GeometryProxy) -> CGFloat {
        let offset = geometry.frame(in: .global).maxY
        
        let height = geometry.size.height
        let blur = (height - max(offset, 0)) / height
        
        return blur * 6
    }
    
    // 1
    private func getHeaderTitleOffset() -> CGFloat {
        let currentYPos = titleRect.midY
        
        if currentYPos < headerImageRect.maxY {
            let minYValue: CGFloat = 50.0
            let maxYValue: CGFloat = collapsedImageHeight
            let currentYValue = currentYPos
            
            let percentage = max(-1, (currentYValue - maxYValue) / (maxYValue - minYValue))
            let finalOffset: CGFloat = -30.0
            
            return 20 - (percentage * finalOffset)
        }
        
        return .infinity
    }
    
    var body: some View {
        ScrollView {
            VStack {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Image("person")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 55, height: 55)
                            .clipShape(Circle())
                            .shadow(radius: 4)
                        
                        VStack(alignment: .leading) {
                            Text("Made by")
                                .font(.avenirNext(size: 12))
                                .foregroundColor(.gray)
                            Text("Arvind Patel")
                                .font(.avenirNext(size: 17))
                        }
                    }
                    .padding(.top, 16.0)
                    Text("Build a Stretchable Header with Scroll view")
                        .font(.avenirNext(size: 28))
                        .background(GeometryGetter(rect: self.$titleRect)) // 2
                    
                    Text(staticText)
                        .lineLimit(nil)
                        .font(.avenirNextRegular(size: 17))
                }
                .padding(.horizontal)
                .padding(.top, 16.0)
            }
            .offset(y: imageHeight + 16)
            .background(GeometryGetter(rect: $articleContent.frame))
            
            GeometryReader { geometry in
                // 3
                ZStack(alignment: .bottom) {
                    Image("wwdcImage")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: self.getHeightForHeaderImage(geometry))
                        .blur(radius: self.getBlurRadiusForImage(geometry))
                        .clipped()
                        .background(GeometryGetter(rect: self.$headerImageRect))
                    
                    // 4
                    Text("Build Parallax strachable Scroll with CodewithArvind")
                        .font(.avenirNext(size: 17))
                        .foregroundColor(.white)
                        .offset(x: 0, y: self.getHeaderTitleOffset())
                }
                .clipped()
                .offset(x: 0, y: self.getOffsetForTopImage(geometry))
            }.frame(height: imageHeight)
                .offset(x: 0, y: -(articleContent.startingRect?.maxY ?? UIScreen.main.bounds.height))
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

let staticText = """
SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift. Build user interfaces for any Apple device using just one set of tools and APIs. With a declarative Swift syntax that’s easy to read and natural to write, SwiftUI works seamlessly with new Xcode design tools to keep your code and design perfectly in sync. Automatic support for Dynamic Type, Dark Mode, localization, and accessibility means your first line of SwiftUI code is already the most powerful UI code you’ve ever written.

SwiftUI uses a declarative syntax so you can simply state what your user interface should do. For example, you can write that you want a list of items consisting of text fields, then describe alignment, font, and color for each field. Your code is simpler and easier to read than ever before, saving you time and maintenance.

Xcode 11 includes intuitive new design tools that make building interfaces with SwiftUI as easy as dragging and dropping. As you work in the design canvas, everything you edit is completely in sync with the code in the adjoining editor. Code is instantly visible as a preview as you type, and any change you make to that preview immediately appears in your code. Xcode recompiles your changes instantly and inserts them into a running version of your app, visible, and editable at all times.

Drag and drop. Arrange components within your user interface by simply dragging controls on the canvas. Click to open an inspector to select font, color, alignment, and other design options, and easily re-arrange controls with your cursor. Many of these visual editors are also available within the code editor, so you can use inspectors to discover new modifiers for each control, even if you prefer hand-coding parts of your interface. You can also drag controls from your library and drop them on the design canvas or directly on the code.
"""

class ViewFrame: ObservableObject {
    var startingRect: CGRect?
    
    @Published var frame: CGRect {
        willSet {
            if startingRect == nil {
                startingRect = newValue
            }
        }
    }
    
    init() {
        self.frame = .zero
    }
}

struct GeometryGetter: View {
    @Binding var rect: CGRect
    
    var body: some View {
        GeometryReader { geometry in
            AnyView(Color.clear)
                .preference(key: RectangleDefaultKey.self, value: geometry.frame(in: .global))
        }.onPreferenceChange(RectangleDefaultKey.self) { (value) in
            self.rect = value
        }
    }
}

struct RectangleDefaultKey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}
