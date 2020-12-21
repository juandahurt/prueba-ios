//
//  User.swift
//  prueba-ios
//
//  Created by juandahurt on 21/12/20.
//

import Foundation

struct User: Identifiable, Codable {
    var id: Int
    var name: String
    var gender: String
    var email: String
    var status: String = "Active"
}

struct UserRequest: Codable {
    var name: String
    var gender: String
    var email: String
    var status: String = "Active"
    
    static func from(user: User) -> UserRequest {
        let userRquest = UserRequest(
            name: user.name,
            gender: user.gender,
            email: user.email
        )
        return userRquest
    }
}

// MARK: - Métodos
extension User {
    static func list() -> [User] {
        let repository = UserRepository()
        
        return repository.list()
    }
    
    static func create(user: User) {
        let repository = UserRepository()
        
        repository.create(user: user)
    }
    
    static func update(user: User) {
        let repository = UserRepository()
        
        repository.update(user: user)
    }
    
    static func delete(userId: Int) {
        let repository = UserRepository()
        
        repository.delete(userId: userId)
    }
}
