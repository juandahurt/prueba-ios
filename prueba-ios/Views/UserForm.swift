//
//  UserForm.swift
//  prueba-ios
//
//  Created by juandahurt on 21/12/20.
//

import SwiftUI

struct UserForm: View {
    var userVM: UserVM
    @State var user: User
    var update: Bool
    
    var body: some View {
        VStack {
            Form {
                TextField("name", text: $user.name)
                TextField("gender", text: $user.gender)
                TextField("email", text: $user.email)
//                Toggle(isOn: $user.status) {
//                    Text("Is Active)
//                }
                Button(update ? "Save" : "Create", action: {
                    if update { userVM.update(user: user) }
                    else { userVM.create(user: user) }
                })
            }
        }
    }
}
