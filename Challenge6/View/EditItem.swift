//
//  EditItem.swift
//  Challenge6
//
//  Created by Parsa Nasirimehr on 2022-11-05.
//

import SwiftUI

struct EditItem: View {
    @Environment(\.dismiss) var dismiss
    var onSave: (User) -> Void
    @StateObject var viewModel: ViewModel
    
    init(user: User, onSave: @escaping (User) -> Void) {
        self.onSave = onSave
        _viewModel = StateObject(wrappedValue: ViewModel(user: user))
    }
    
    var body: some View {
        VStack {
            if let image = viewModel.user.image {
                Image(uiImage: image)
                    .resizable()
                    .frame(height: 300)
            }
            TextField("Enter the name for this person", text: $viewModel.name)
                .padding(.leading)
            Spacer()
        }
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
