//
//  UserVM.swift
//  prueba-ios
//
//  Created by juandahurt on 21/12/20.
//

import Foundation

class UserVM: ObservableObject {
    @Published var _users = [User]()
    
    init() {
        _users.append(User(id: 1, name: "as", gender: "Gender", email: "as@asd.cas"))
        _users.append(User(id: 1, name: "as", gender: "Gender", email: "as@asd.cas"))
        _users.append(User(id: 1, name: "as", gender: "Gender", email: "as@asd.cas"))
    }
    
    var users: [User] {
        _users
    }
    
    func reload() {
        DispatchQueue.main.async {
            self._users = User.list()
            print(self._users)
        }
    }
    
    func create(user: User) {
        User.create(user: user)
    }
    
    func update(user: User) {
        User.update(user: user)
    }
    
    func delete(userId: Int) {
//        User.delete(userId: )
    }
}
