//
//  ProfileModel.swift
//  tinder-template
//
//  Created by Arvind on 01/12/20.
//  Refactored to follow SOLID principles
//

import SwiftUI

// MARK: - Protocols (Dependency Inversion Principle)
protocol ProfileIdentifiable {
    var id: UUID { get }
}

protocol ProfileDisplayable {
    var imageName: String { get }
    var personName: String { get }
}

protocol ProfileInteractable {
    var offsetValue: CGFloat { get set }
}

// MARK: - Profile Model (Single Responsibility)
struct ProfileModel: Identifiable, Equatable, ProfileIdentifiable, ProfileDisplayable, ProfileInteractable {
    let id = UUID()
    let imageName: String
    let personName: String
    var offsetValue: CGFloat
    
    init(imageName: String, personName: String, offsetValue: CGFloat = 0) {
        self.imageName = imageName
        self.personName = personName
        self.offsetValue = offsetValue
    }
    
    // Equatable conformance
    static func == (lhs: ProfileModel, rhs: ProfileModel) -> Bool {
        return lhs.id == rhs.id
    }
}

// MARK: - Profile Service Protocol (Interface Segregation)
protocol ProfileServiceProtocol {
    func getProfiles() -> [ProfileModel]
    func addProfile(_ profile: ProfileModel)
    func removeProfile(withId id: UUID)
}

// MARK: - Profile Service Implementation (Single Responsibility)
class ProfileService: ProfileServiceProtocol {
    private var profiles: [ProfileModel] = []
    
    init() {
        loadDefaultProfiles()
    }
    
    private func loadDefaultProfiles() {
        profiles = [
            ProfileModel(imageName: "image1", personName: "Elena markus"),
            ProfileModel(imageName: "image2", personName: "Ana-Maria"),
            ProfileModel(imageName: "image3", personName: "Katrina"),
            ProfileModel(imageName: "image4", personName: "Emily john"),
            ProfileModel(imageName: "image1", personName: "Sarah Wilson"),
            ProfileModel(imageName: "image2", personName: "Jessica Brown"),
            ProfileModel(imageName: "image3", personName: "Maria Garcia"),
            ProfileModel(imageName: "image4", personName: "Lisa Anderson"),
        ]
    }
    
    func getProfiles() -> [ProfileModel] {
        return profiles
    }
    
    func addProfile(_ profile: ProfileModel) {
        profiles.append(profile)
    }
    
    func removeProfile(withId id: UUID) {
        profiles.removeAll { $0.id == id }
    }
} 