//
//  UserRepository.swift
//  prueba-ios
//
//  Created by juandahurt on 21/12/20.
//

import Foundation

struct UserRepository {
    var endpoint = "/public-api/users"
    var network = Network()
    
    func create(user: User) {
//        print(UserRequest.from(user: user))
        let body = try! JSONEncoder().encode(UserRequest.from(user: user))
//        print(body)
        network.makeHttpRequest(endpoint, method: "POST", body: body, completion: nil)
    }
    
    func list() -> [User] {
        var userList = [User]()
        network.makeHttpRequest(endpoint, method: "GET", body: nil, completion: { json in
            let jsonList = json["data"] as! [[String: Any]]
            jsonList.forEach({ json in
                 let user = try! JSONDecoder().decode(User.self, from: JSONSerialization.data(withJSONObject: json, options: []))
                userList.append(user)
             })
            print(userList)
        })
        return userList
    }
    
    func update(user: User) {
        let body = try! JSONEncoder().encode(UserRequest.from(user: user))
        network.makeHttpRequest(endpoint, method: "PATCH", body: body, completion: nil)
    }
    
    func delete(userId: Int) {
        network.makeHttpRequest(endpoint + "/" + String(userId), method: "DELETE", body: nil, completion: nil)
    }
}
