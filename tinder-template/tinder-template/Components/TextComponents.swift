//
//  TextComponents.swift
//  tinder-template
//
//  Created by Arvind on 01/12/20.
//  Refactored to follow SOLID principles
//

import SwiftUI

// MARK: - Text Component Protocols (Interface Segregation)
protocol TextDisplayable {
    var text: String { get }
    var font: Font { get }
    var fontWeight: Font.Weight { get }
}

protocol TextStylable {
    var foregroundColor: Color { get }
    var alignment: TextAlignment { get }
}

// MARK: - Base Text Component (Single Responsibility)
struct BaseTextComponent: View {
    let displayable: TextDisplayable
    let stylable: TextStylable
    var customColor: Color? = .black
    
    init(displayable: TextDisplayable, stylable: TextStylable, customColor: Color? = nil) {
        self.displayable = displayable
        self.stylable = stylable
        self.customColor = customColor
    }
    
    var body: some View {
        Text(displayable.text)
            .font(displayable.font)
            .fontWeight(displayable.fontWeight)
            .foregroundColor(customColor ?? stylable.foregroundColor)
            .multilineTextAlignment(stylable.alignment)
    }
}

// MARK: - Title Text Component (Single Responsibility)
struct TitleTextComponent: View, TextDisplayable, TextStylable {
    let text: String
    let font: Font = .title
    let fontWeight: Font.Weight = .bold
    let foregroundColor: Color = .primary
    let alignment: TextAlignment = .leading
    var customColor: Color? = nil
    
    var body: some View {
        BaseTextComponent(displayable: self, stylable: self, customColor: customColor)
    }
}

// MARK: - Status Text Component (Single Responsibility)
struct StatusTextComponent: View, TextDisplayable, TextStylable {
    let text: String
    let font: Font = .title
    let fontWeight: Font.Weight = .bold
    let foregroundColor: Color = .white
    let alignment: TextAlignment = .center
    
    var body: some View {
        BaseTextComponent(displayable: self, stylable: self)
    }
}

// MARK: - Profile Name Text Component (Single Responsibility)
struct ProfileNameTextComponent: View, TextDisplayable, TextStylable {
    let text: String
    let font: Font = .title
    let fontWeight: Font.Weight = .bold
    let foregroundColor: Color = .white
    let alignment: TextAlignment = .leading
    
    var body: some View {
        BaseTextComponent(displayable: self, stylable: self)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: - Legacy Support (for backward compatibility)
struct TextProvider: View {
    let labelText: String
    var customColor: Color? = nil
    
    var body: some View {
        TitleTextComponent(text: labelText, customColor: customColor)
    }
}

struct TextWithInfinityWidth: View {
    let labelText: String
    
    var body: some View {
        ProfileNameTextComponent(text: labelText)
    }
}

// MARK: - Status Overlay Component (Single Responsibility)
struct StatusOverlayComponent: View {
    let offset: CGFloat
    
    var body: some View {
        if offset > 0 {
            Color.green
        } else if offset < 0 {
            Color.red
        } else {
            Color.clear
        }
    }
}

// MARK: - Legacy Support (for backward compatibility)
struct ViewOffSetProvider: View {
    let offset: CGFloat
    
    var body: some View {
        StatusOverlayComponent(offset: offset)
    }
} 
