//
//  ContentView+ViewModel.swift
//  Challenge6
//
//  Created by Parsa Nasirimehr on 2022-11-05.
//

import Foundation
import SwiftUI

extension ContentView {
    
    @MainActor class ViewModel: ObservableObject {
        @Published var isShowingPicker = false
        @Published var users: [User]
        @Published var path = NavigationPath()
        @Published var inputImage: UIImage? {
            didSet {
                if let inputImage {
                    do {
                        let imageName = "\(UUID().uuidString).jpg"
                        try ImageService.writeImageToDisk(image: inputImage, imageName: imageName)
                        showDetailScreen(user: User(name: "", pictureName: imageName))
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        
        var savePath = FileManager.documentsDirectory.appendingPathComponent("savedPeople")
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                users = try JSONDecoder().decode([User].self, from: data)
            } catch {
                print("Error loading data")
                users = []
            }
        }
        
        func showDetailScreen(user: User) -> Void {
            Task { @MainActor in
                self.path.append(user)
            }
        }
        
        func save() -> Void {
            do {
                let data = try JSONEncoder().encode(users)
                try data.write(to: savePath, options: [NSData.WritingOptions.atomic, .completeFileProtection])
            } catch {
                print("Unable to save data.")
            }
        }
        
        func updateOrAddUser(user: User) -> Void {
            print(path.count)
            if let index = users.firstIndex(of: user) {
                users[index] = user
            } else {
                users.append(user)
            }
            save()
        }
    }
}
