//
//  User.swift
//  Challenge6
//
//  Created by Parsa Nasirimehr on 2022-11-05.
//

import Foundation
import UIKit

struct User: Identifiable, Codable, Equatable, Hashable {
    var id = UUID()
    var name: String
    var pictureName: String
    var image: UIImage? {
        do {
            return try ImageService.readImageFromDisk(imageName: pictureName)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    static func ==(lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }
    
    static var dummy = User(name: "Dummy", pictureName: "dummyName.jpg")
}
