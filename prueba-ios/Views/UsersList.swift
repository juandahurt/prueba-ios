//
//  UsersList.swift
//  prueba-ios
//
//  Created by juandahurt on 21/12/20.
//

import SwiftUI

struct UsersList: View {
    @ObservedObject var userVM: UserVM
    
    var body: some View {
        NavigationView {
            List {
                ForEach(userVM.users) { user in
                    UserRow(user: user, userVM: userVM)
                }
            }
                .navigationTitle("Rinnapp")
                .navigationBarItems(
                    trailing: HStack {
                        Button("Reload", action: {
                            userVM.reload()
                        })
                        NavigationLink(
                           "Add",
                           destination: UserForm(
                               userVM: userVM,
                               user: User(id: -1, name: "", gender: "", email: ""),
                               update: false
                           )
                       )
                    }
                )
        }
    }
}
