//
//  APIConstants.swift
//  Clone-Instagram
//
//  Created by madilyn on 2022/06/10.
//

import Foundation
import Alamofire

struct APIConstants {
    // MARK: Base URL
    static let baseURL = "http://13.124.62.236"
    
    // MARK: Feature URL
    static let postSignUp = baseURL + "/auth/signup"
    static let postSignIn = baseURL + "/auth/signin"
}
