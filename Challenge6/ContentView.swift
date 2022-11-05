//
//  ContentView.swift
//  Challenge6
//
//  Created by Parsa Nasirimehr on 2022-11-04.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack(path: $viewModel.path) {
            List {
                ForEach(viewModel.users) { user in
                    Button{
                        viewModel.showDetailScreen(user: user)
                    } label: {
                        HStack {
                            Text(user.name)
                            Spacer()
                            if let image = user.image {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .cornerRadius(8)
                            }
                        }
                    }
                }
            }
            .toolbar(content: {
                Button {
                    viewModel.isShowingPicker = true
                } label: {
                    Image(systemName: "plus")
                }
            })
            .navigationTitle("People tracker")
            .sheet(isPresented: $viewModel.isShowingPicker) {
                ImagePicker(image: $viewModel.inputImage)
            }
            .navigationDestination(for: User.self, destination: { user in
                EditItem(user: user) { user in
                    viewModel.updateOrAddUser(user: user)
                }
            })
            .onAppear {
                viewModel.startLocationService()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
