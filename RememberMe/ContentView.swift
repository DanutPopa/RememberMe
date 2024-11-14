//
//  ContentView.swift
//  RememberMe
//
//  Created by Danut Popa on 13.11.2024.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    @State private var viewModel = ViewModel()
    @State private var showingNamingPrompt = false
    
    var body: some View {
        VStack {
            PhotosPicker(selection: $viewModel.pickerItem, matching: .all(of: [.images, .not(.screenshots)])) {
                Label("Select a picture", systemImage: "photo")
            }
            
        }
        .sheet(isPresented: $showingNamingPrompt) {
            NamePhotoView(photoName: $viewModel.photoName)
        }
        .onChange(of: viewModel.pickerItem) {
            // When a photo is selected, show the name prompt
            showingNamingPrompt = true
            Task {
                try await viewModel.loadSelectedImage()
            }
        }
    }
}


#Preview {
    ContentView()
}
