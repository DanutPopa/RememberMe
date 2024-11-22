//
//  PhotoLibrary.swift
//  RememberMe
//
//  Created by Danut Popa on 14.11.2024.
//

import MapKit
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
    
    var location = Location(id: UUID(), latitude: 45.9432, longitude: 24.9668)
    
    static func <(lhs: NamedFace, rhs: NamedFace) -> Bool {
        lhs.name < rhs.name
    }
    
    static func == (lhs: NamedFace, rhs: NamedFace) -> Bool {
        lhs.id == rhs.id
    }
    
    static let example = NamedFace(id: UUID(), name: "Bucharest", imageData: Data(), location: Location(id: UUID(), latitude: 44.4268, longitude: 26.1025))
}
