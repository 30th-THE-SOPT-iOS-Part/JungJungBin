//
//  SignUpDataModel.swift
//  Clone-Instagram
//
//  Created by madilyn on 2022/06/10.
//

import Foundation

struct SignUpDataModel: Codable {
    let id: Int

    enum CodingKeys: String, CodingKey {
        case id = "id"
    }
}
