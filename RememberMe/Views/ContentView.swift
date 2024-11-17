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
    
    var body: some View {
        VStack {
            PhotosPicker(selection: $viewModel.pickerItem, matching: .all(of: [.images, .not(.screenshots)])) {
                Label("Select a picture", systemImage: "photo")
            }
        }
        
        .onChange(of: viewModel.pickerItem) {
            Task {
                viewModel.selectedImage = try await viewModel.pickerItem?.loadTransferable(type: Data.self)
            }
        }
    }
}

#Preview {
    ContentView()
}
