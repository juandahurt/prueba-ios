//
//  UserRow.swift
//  prueba-ios
//
//  Created by juandahurt on 21/12/20.
//

import SwiftUI

struct UserRow: View {
    var user: User
    var userVM: UserVM
    
    var body: some View {
        HStack {
            Text(user.name)
            NavigationLink(destination: UserForm(userVM: userVM, user: user, update: true)) {
                Text("Editar")
            }
        }
    }
}
