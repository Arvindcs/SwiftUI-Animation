//
//  ButtonComponents.swift
//  tinder-template
//
//  Created by Arvind on 01/12/20.
//  Refactored to follow SOLID principles
//

import SwiftUI

// MARK: - Button Component Protocols (Interface Segregation)
protocol ButtonDisplayable {
    var imageName: String { get }
    var size: CGSize { get }
}

protocol ButtonInteractable {
    var action: () -> Void { get }
    var isEnabled: Bool { get }
}

// MARK: - Base Button Component (Single Responsibility)
struct BaseButtonComponent: View {
    let displayable: ButtonDisplayable
    let interactable: ButtonInteractable
    
    init(displayable: ButtonDisplayable, interactable: ButtonInteractable) {
        self.displayable = displayable
        self.interactable = interactable
    }
    
    var body: some View {
        Button(action: interactable.action) {
            Image(displayable.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: displayable.size.width, height: displayable.size.height)
        }
        .disabled(!interactable.isEnabled)
    }
}

// MARK: - System Icon Button Component (Single Responsibility)
struct SystemIconButtonComponent: View, ButtonDisplayable, ButtonInteractable {
    let imageName: String
    let size: CGSize = AppConfig.UI.systemButtonSize
    let action: () -> Void
    let isEnabled: Bool = true
    
    var body: some View {
        Button(action: action) {
            Image(systemName: imageName)
                .resizable()
                .frame(width: size.width, height: size.height)
        }
    }
}

// MARK: - Bottom Action Button Component (Single Responsibility)
struct BottomActionButtonComponent: View, ButtonDisplayable, ButtonInteractable {
    let imageName: String
    let size: CGSize = AppConfig.UI.buttonSize
    let action: () -> Void
    let isEnabled: Bool = true
    
    var body: some View {
        BaseButtonComponent(displayable: self, interactable: self)
    }
}

// MARK: - Separator Component (Single Responsibility)
struct SeparatorComponent: View {
    var body: some View {
        Divider()
            .frame(width: 150, height: 1)
            .background(Color.white)
            .padding(.vertical, 30)
    }
}

// MARK: - Legacy Support (for backward compatibility)
struct ButtonProvider: View {
    let imageName: String
    let action: () -> Void
    
    var body: some View {
        SystemIconButtonComponent(imageName: imageName, action: action)
    }
}

struct BottomButton: View {
    let imageName: String
    let action: () -> Void
    
    var body: some View {
        BottomActionButtonComponent(imageName: imageName, action: action)
    }
}

struct Separator: View {
    var body: some View {
        SeparatorComponent()
    }
} 