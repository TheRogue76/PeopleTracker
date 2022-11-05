//
//  EditItem.swift
//  Challenge6
//
//  Created by Parsa Nasirimehr on 2022-11-05.
//

import SwiftUI
import MapKit

struct EditItem: View {
    @Environment(\.dismiss) var dismiss
    var onSave: (User) -> Void
    @StateObject var viewModel: ViewModel
    
    init(user: User, onSave: @escaping (User) -> Void) {
        self.onSave = onSave
        _viewModel = StateObject(wrappedValue: ViewModel(user: user))
    }
    
    var body: some View {
        ScrollView {
            VStack {
                if let image = viewModel.user.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                        .cornerRadius(12)
                }
                
                Toggle("Show image location", isOn: $viewModel.showMap.animation())
                
                if viewModel.showMap {
                    Map(coordinateRegion: $viewModel.mapRegion, annotationItems: viewModel.locations) { location in
                        MapAnnotation(coordinate: location.coordinate) {
                            Image(systemName: "star.circle")
                                .resizable()
                                .foregroundColor(.red)
                                .frame(width: 44, height: 44)
                                .background(.white)
                                .clipShape(Circle())
                        }
                    }
                    .frame(height: 300)
                    .cornerRadius(12)
                }
                
                TextField("Enter the name for this person", text: $viewModel.name)
                Spacer()
            }
            .padding()
        }
        .navigationTitle(viewModel.user.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button("Save") {
                onSave(viewModel.updateUserBasedOnFields())
                dismiss()
            }
        }
    }
}

struct EditItem_Previews: PreviewProvider {
    static var previews: some View {
        EditItem(user: User.dummy) { _ in }
    }
}
