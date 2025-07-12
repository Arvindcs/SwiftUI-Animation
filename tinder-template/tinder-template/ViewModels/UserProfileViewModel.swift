//
//  UserProfileViewModel.swift
//  tinder-template
//
//  Created by Arvind on 01/12/20.
//  Refactored to follow SOLID principles
//

import SwiftUI
import Combine

// MARK: - User Profile View Model Protocol (Dependency Inversion)
protocol UserProfileViewModelProtocol: ObservableObject {
    var profile: ProfileModel { get set }
    var currentOffset: CGFloat { get }
    var rotationAngle: Double { get }
    var statusText: String { get }
    var statusColor: Color { get }
    var isStatusVisible: Bool { get }
    
    func handleLike()
    func handleDislike()
    func handleSuperLike()
    func handleRewind()
    func handleDragChange(_ value: DragGesture.Value)
    func handleDragEnd(_ value: DragGesture.Value)
}

// MARK: - User Profile View Model Implementation (Single Responsibility)
class UserProfileViewModel: UserProfileViewModelProtocol {
    @Published var profile: ProfileModel
    @Published private(set) var currentOffset: CGFloat = 0
    
    private let gestureManager: GestureManagerProtocol
    private let actionManager: ActionManagerProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(profile: ProfileModel, 
         gestureManager: GestureManagerProtocol = GestureManager(),
         actionManager: ActionManagerProtocol = ActionManager()) {
        self.profile = profile
        self.gestureManager = gestureManager
        self.actionManager = actionManager
        
        setupBindings()
    }
    
    private func setupBindings() {
        gestureManager.offsetPublisher
            .assign(to: \.currentOffset, on: self)
            .store(in: &cancellables)
    }
    
    var rotationAngle: Double {
        if currentOffset == 0 { return 0 }
        return currentOffset > 0 ? AppConfig.Animation.rotationAngle : -AppConfig.Animation.rotationAngle
    }
    
    var statusText: String {
        if currentOffset == 0 { return "" }
        return currentOffset > 0 ? AppConfig.Text.likeText : AppConfig.Text.dislikeText
    }
    
    var statusColor: Color {
        return currentOffset > 0 ? AppConfig.Colors.likeColor : AppConfig.Colors.dislikeColor
    }
    
    var isStatusVisible: Bool {
        return currentOffset != 0
    }
    
    func handleLike() {
        let offset = actionManager.getOffsetForAction(.like)
        gestureManager.setOffset(offset)
        actionManager.performAction(.like, for: profile.id)
    }
    
    func handleDislike() {
        let offset = actionManager.getOffsetForAction(.dislike)
        gestureManager.setOffset(offset)
        actionManager.performAction(.dislike, for: profile.id)
    }
    
    func handleSuperLike() {
        let offset = actionManager.getOffsetForAction(.superLike)
        gestureManager.setOffset(offset)
        actionManager.performAction(.superLike, for: profile.id)
    }
    
    func handleRewind() {
        gestureManager.resetOffset()
        actionManager.performAction(.rewind, for: profile.id)
    }
    
    func handleDragChange(_ value: DragGesture.Value) {
        gestureManager.handleDragChange(value)
    }
    
    func handleDragEnd(_ value: DragGesture.Value) {
        gestureManager.handleDragEnd(value)
    }
} 