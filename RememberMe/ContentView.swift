//
//  ContentView.swift
//  RememberMe
//
//  Created by Danut Popa on 13.11.2024.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    @State private var pickerItem: PhotosPickerItem?
    @State private var selectedImage: Image?
    
    @State private var showingNamingPrompt = false
    @State private var photoName = ""
    
    var body: some View {
        VStack {
            PhotosPicker(selection: $pickerItem, matching: .all(of: [.images, .not(.screenshots)])) {
                Label("Select a picture", systemImage: "photo")
            }
            
            if showingNamingPrompt {
                NamePhotoView(photoName: $photoName, isPresented: $showingNamingPrompt)
            } else {
                selectedImage?
                    .resizable()
                    .scaledToFit()
            }
            
        }
        .onChange(of: pickerItem) { _, newItem in
            guard newItem != nil else { return }
            // When a photo is selected, show the name prompt
            showingNamingPrompt = true
            Task {
                selectedImage = try await pickerItem?.loadTransferable(type: Image.self)
            }
        }
    }
}


#Preview {
    ContentView()
}
