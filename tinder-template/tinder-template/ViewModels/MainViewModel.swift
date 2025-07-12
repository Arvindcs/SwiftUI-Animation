//
//  MainViewModel.swift
//  tinder-template
//
//  Created by Arvind on 01/12/20.
//  Refactored to follow SOLID principles
//

import SwiftUI
import Combine

// MARK: - Main View Model Protocol (Dependency Inversion)
protocol MainViewModelProtocol: ObservableObject {
    var profiles: [ProfileModel] { get }
    var isLoading: Bool { get }
    
    func loadProfiles()
    func refreshProfiles()
    func onMenuButtonTapped()
    func removeProfile(_ profile: ProfileModel)
}

// MARK: - Main View Model Implementation (Single Responsibility)
class MainViewModel: MainViewModelProtocol {
    @Published private(set) var profiles: [ProfileModel] = []
    @Published private(set) var isLoading: Bool = false
    
    private let profileService: ProfileServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(profileService: ProfileServiceProtocol = ProfileService()) {
        self.profileService = profileService
        loadProfiles()
    }
    
    func loadProfiles() {
        isLoading = true
        
        // Simulate async loading
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            self?.profiles = self?.profileService.getProfiles() ?? []
            self?.isLoading = false
        }
    }
    
    func refreshProfiles() {
        loadProfiles()
    }
    
    func onMenuButtonTapped() {
        // Handle menu button tap
        print("Menu button tapped")
    }
    
    func removeProfile(_ profile: ProfileModel) {
        print("Removing profile: \(profile.personName), current count: \(profiles.count)")
        profiles.removeAll { $0.id == profile.id }
        print("After removal, count: \(profiles.count)")
    }
} 