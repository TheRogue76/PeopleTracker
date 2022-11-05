//
//  ImageSaver.swift
//  Challenge6
//
//  Created by Parsa Nasirimehr on 2022-11-05.
//

import UIKit

enum ImageLoadingError: Error {
case couldNotLoadImageFromURL
}

class ImageService: NSObject {
    static var baseUrl = FileManager.documentsDirectory.appendingPathComponent("savedImages")
    
    static func writeImageToDisk(image: UIImage, imageName: String) throws -> Void {
        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try jpegData.write(to: URL(filePath: imageName, relativeTo: baseUrl), options: [.atomic, .completeFileProtection])
        }
    }
    
    static func readImageFromDisk(imageName: String) throws -> UIImage {
        let fileData = try Data(contentsOf: URL(filePath: imageName, relativeTo: baseUrl))
        guard let image = UIImage(data: fileData) else {
            throw ImageLoadingError.couldNotLoadImageFromURL
        }
        return image
    }
}
