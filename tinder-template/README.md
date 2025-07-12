# Tinder Template - Refactored with SOLID Principles

This project has been refactored to follow SOLID principles, providing a clean, maintainable, and scalable architecture for a Tinder-like dating app interface.

## 🏗️ Architecture Overview

The refactored codebase follows a clean architecture pattern with clear separation of concerns:

```
tinder-template/
├── Models/                 # Data models and protocols
├── Services/              # Business logic and external dependencies
├── ViewModels/            # View models for state management
├── Views/                 # SwiftUI views (UI layer only)
├── Components/            # Reusable UI components
├── Config/                # App-wide configuration
└── AppDelegate/           # App lifecycle management
```

## 🔧 SOLID Principles Implementation

### 1. Single Responsibility Principle (SRP)

Each class and component has a single, well-defined responsibility:

- **Models**: Data structures and protocols
- **Services**: Business logic (ProfileService, GestureManager, ActionManager)
- **ViewModels**: State management and UI logic
- **Views**: UI presentation only
- **Components**: Reusable UI elements

### 2. Open/Closed Principle (OCP)

The code is open for extension but closed for modification:

- **Protocols**: All major components implement protocols
- **Configuration**: App-wide settings in `AppConfig`
- **Services**: Easy to extend with new functionality

### 3. Liskov Substitution Principle (LSP)

All implementations can be substituted for their protocols:

- `ProfileService` implements `ProfileServiceProtocol`
- `GestureManager` implements `GestureManagerProtocol`
- `ActionManager` implements `ActionManagerProtocol`

### 4. Interface Segregation Principle (ISP)

Interfaces are focused and specific:

- `TextDisplayable` and `TextStylable` for text components
- `ButtonDisplayable` and `ButtonInteractable` for buttons
- `ImageDisplayable` and `ImageStylable` for images

### 5. Dependency Inversion Principle (DIP)

High-level modules don't depend on low-level modules:

- **DependencyContainer**: Centralized dependency management
- **Protocol-based dependencies**: All dependencies use protocols
- **Injection**: Dependencies are injected rather than created

## 📁 Key Components

### Models
- `ProfileModel`: Core data structure for user profiles
- Protocols: `ProfileIdentifiable`, `ProfileDisplayable`, `ProfileInteractable`

### Services
- `ProfileService`: Manages profile data operations
- `GestureManager`: Handles swipe gestures and animations
- `ActionManager`: Manages user actions (like, dislike, super like)
- `DependencyContainer`: Centralized dependency injection

### ViewModels
- `MainViewModel`: Manages main view state and profile loading
- `UserProfileViewModel`: Manages individual profile interactions

### Views
- `MainView`: Main app interface
- `UserProfileView`: Individual profile card
- `HeaderView`, `ProfileStackView`, `LoadingView`: Modular UI components

### Components
- `TextComponents`: Reusable text components with protocols
- `ButtonComponents`: Reusable button components
- `ImageComponents`: Reusable image components

### Configuration
- `AppConfig`: Centralized configuration for animations, colors, text, and UI constants

## 🚀 Benefits of Refactoring

### Maintainability
- Clear separation of concerns
- Easy to locate and modify specific functionality
- Consistent patterns throughout the codebase

### Testability
- Protocol-based architecture enables easy mocking
- Dependency injection allows for unit testing
- Isolated components can be tested independently

### Scalability
- Easy to add new features without modifying existing code
- Reusable components reduce code duplication
- Configuration-driven approach for easy customization

### Flexibility
- Easy to swap implementations (e.g., different profile services)
- Configuration changes don't require code modifications
- Protocol-based design allows for multiple implementations

## 🔄 Usage Examples

### Creating a New Profile Service
```swift
class RemoteProfileService: ProfileServiceProtocol {
    func getProfiles() -> [ProfileModel] {
        // Implementation for remote data
    }
}

// Update dependency container
DependencyContainer.shared.profileService = RemoteProfileService()
```

### Adding New Actions
```swift
enum ProfileAction {
    case like, dislike, superLike, rewind, block // New action
}

// ActionManager automatically handles new actions
```

### Customizing UI
```swift
// Update AppConfig for app-wide changes
AppConfig.UI.buttonSize = CGSize(width: 80, height: 80)
AppConfig.Colors.likeColor = .blue
```

## 🧪 Testing

The refactored architecture makes testing straightforward:

```swift
// Mock dependencies
let mockProfileService = MockProfileService()
let mockGestureManager = MockGestureManager()

// Test view models
let viewModel = UserProfileViewModel(
    profile: testProfile,
    gestureManager: mockGestureManager,
    actionManager: mockActionManager
)
```

## 📱 Features

- **Swipe Gestures**: Smooth left/right swipe interactions
- **Action Buttons**: Like, dislike, super like, and rewind functionality
- **Animations**: Configurable animations and transitions
- **Loading States**: Proper loading indicators
- **Modular UI**: Reusable components for consistent design

## 🔧 Requirements

- iOS 14.0+
- Swift 5.0+
- SwiftUI

## 📄 License

This project is part of the SwiftUI Animation collection. 