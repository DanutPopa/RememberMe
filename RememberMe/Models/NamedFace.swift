//
//  PhotoLibrary.swift
//  RememberMe
//
//  Created by Danut Popa on 14.11.2024.
//

import SwiftUI

struct NamedFace: Codable, Identifiable, Equatable {
    var id: UUID
    var name: String
    var imageData: Data
    var image: Image? {
        if let uiImage = UIImage(data: imageData) {
            return Image(uiImage: uiImage)
        } else {
            return nil
        }
    }
    
    static let example = NamedFace(id: UUID(), name: "", imageData: Data())
}
