//
//  Network.swift
//  prueba-ios
//
//  Created by juandahurt on 21/12/20.
//

import Foundation

struct Network {
    var baseUrl = Server.test
    
    func makeHttpRequest(_ endpoint: String, method: String, body: Data?, completion: (([String: Any]) -> Void)?) {
        let url = URL(string: baseUrl + endpoint)!
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.setValue("Bearer " + Session.token, forHTTPHeaderField: "Authorization")
        if let body = body {
            request.httpBody = body
        }

        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            if let error = error {
                print("error: \(error)")
            }
            print(response)
            if let data = data {
                let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                if let completion = completion, let jsonResponse = jsonResponse {
                    completion(jsonResponse)
                }
            }
        }).resume()
    }
}

struct Server {
    static var test = "https://gorest.co.in"
}

struct Session {
    static var token = "84f93276701f8d7169c2f6fd92cc1756019aa116c7736129eac563a87de8986e"
}
