//
//  EditItem+ViewModel.swift
//  Challenge6
//
//  Created by Parsa Nasirimehr on 2022-11-05.
//

import Foundation
import MapKit

extension EditItem {
    @MainActor class ViewModel: ObservableObject {
        @Published var user: User
        
        @Published var name: String
        
        @Published var showMap = false
        
        @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
        
        @Published private(set) var locations = [Location]()
        
        init(user: User) {
            self.user = user
            self.name = user.name
            if let location = user.location {
                locations = [location]
            }
        }
        
        func updateUserBasedOnFields() -> User {
            var newUser = user
            newUser.name = name
            return newUser
        }
    }
}
