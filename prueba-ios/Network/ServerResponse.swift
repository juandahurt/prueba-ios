//
//  ServerResponse.swift
//  prueba-ios
//
//  Created by juandahurt on 21/12/20.
//

import Foundation

struct ServerResponse: Codable {
    var code: Int
    var meta: Any
    var data: Any
}
