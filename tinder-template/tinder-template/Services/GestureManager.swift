//
//  GestureManager.swift
//  tinder-template
//
//  Created by Arvind on 01/12/20.
//  Refactored to follow SOLID principles
//

import SwiftUI
import Combine

// MARK: - Gesture Manager Protocol (Dependency Inversion)
protocol GestureManagerProtocol {
    var offsetPublisher: AnyPublisher<CGFloat, Never> { get }
    func handleDragChange(_ value: DragGesture.Value)
    func handleDragEnd(_ value: DragGesture.Value)
    func resetOffset()
    func setOffset(_ offset: CGFloat)
    func getCurrentOffset() -> CGFloat
}

// MARK: - Gesture Manager Implementation (Single Responsibility)
class GestureManager: ObservableObject, GestureManagerProtocol {
    @Published private var currentOffset: CGFloat = 0
    
    var offsetPublisher: AnyPublisher<CGFloat, Never> {
        $currentOffset.eraseToAnyPublisher()
    }
    
    private let swipeThreshold: CGFloat = AppConfig.Gesture.swipeThreshold
    private let swipeDistance: CGFloat = AppConfig.Gesture.swipeDistance
    
    func handleDragChange(_ value: DragGesture.Value) {
        withAnimation(.default) {
            currentOffset = value.translation.width
        }
    }
    
    func handleDragEnd(_ value: DragGesture.Value) {
        withAnimation(.easeIn(duration: AppConfig.Animation.swipeDuration)) {
            if currentOffset > swipeThreshold {
                currentOffset = swipeDistance
            } else if currentOffset < -swipeThreshold {
                currentOffset = -swipeDistance
            } else {
                currentOffset = 0
            }
        }
    }
    
    func resetOffset() {
        withAnimation(.easeIn(duration: AppConfig.Animation.swipeDuration)) {
            currentOffset = 0
        }
    }
    
    func getCurrentOffset() -> CGFloat {
        return currentOffset
    }
    
    func setOffset(_ offset: CGFloat) {
        currentOffset = offset
    }
} 