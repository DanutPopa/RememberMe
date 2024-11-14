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
        private(set) var selectedImage: Data?
        var photoName = ""
        
        func loadSelectedImage() async throws {
            selectedImage = try await pickerItem?.loadTransferable(type: Data.self)
        }
    }
}
