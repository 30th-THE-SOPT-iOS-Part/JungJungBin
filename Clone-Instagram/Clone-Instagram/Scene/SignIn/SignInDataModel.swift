//
//  SignInDataModel.swift
//  Clone-Instagram
//
//  Created by madilyn on 2022/06/10.
//

import Foundation

struct SignInDataModel: Codable {
    let name: String
    let email: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case email = "email"
    }
}
