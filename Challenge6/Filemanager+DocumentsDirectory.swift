//
//  Filemanager+DocumentsDirectory.swift
//  Challenge6
//
//  Created by Parsa Nasirimehr on 2022-11-05.
//

import Foundation
extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
