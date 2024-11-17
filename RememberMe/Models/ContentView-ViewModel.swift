//
//  ContentView-ViewModel.swift
//  RememberMe
//
//  Created by Danut Popa on 14.11.2024.
//

import SwiftUI
import PhotosUI

extension ContentView {
    @Observable
    class ViewModel {
        var pickerItem: PhotosPickerItem?
        var selectedImage: Data?
        var namedFaces: [NamedFace]
        
        let savePath = URL.documentsDirectory.appending(path: "SavedPhotos")
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                namedFaces = try JSONDecoder().decode([NamedFace].self, from: data)
            } catch {
                namedFaces = []
            }
        }
        
        func save() {
            do {
                let data = try JSONEncoder().encode(namedFaces)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("Unable to save data.")
            }
        }
    }
}
