//
//  EditItem+ViewModel.swift
//  Challenge6
//
//  Created by Parsa Nasirimehr on 2022-11-05.
//

import Foundation

extension EditItem {
    @MainActor class ViewModel: ObservableObject {
        @Published var user: User
        @Published var name: String
        init(user: User) {
            self.user = user
            self.name = user.name
        }
        
        func updateUserBasedOnFields() -> User {
            var newUser = user
            newUser.name = name
            return newUser
        }
    }
}
