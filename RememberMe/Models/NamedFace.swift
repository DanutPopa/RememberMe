//
//  PhotoLibrary.swift
//  RememberMe
//
//  Created by Danut Popa on 14.11.2024.
//

import SwiftUI

struct NamedFace: Codable, Identifiable, Comparable {
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
    
    static func <(lhs: NamedFace, rhs: NamedFace) -> Bool {
        lhs.name < rhs.name
    }
    
    static let example = NamedFace(id: UUID(), name: "", imageData: Data())
}
