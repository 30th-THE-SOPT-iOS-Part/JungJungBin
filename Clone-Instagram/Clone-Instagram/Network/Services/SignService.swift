//
//  SignService.swift
//  Clone-Instagram
//
//  Created by madilyn on 2022/06/10.
//

import Alamofire

/*
 AuthRouter : 여러 Endpoint들을 갖고 있는 enum
 TargetType을 채택해서 path, method, header, parameter를 각 라우터에 맞게 request를 만든다.
 */

enum SignService {
    case postSignUp(name: String, email: String, password: String)
    case postSignIn(name: String, email: String, password: String)
}

extension SignService: TargetType {
    var path: String {
        switch self {
        case .postSignUp:
            return "/auth/signup"
        case .postSignIn:
            return "/auth/signin"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .postSignUp, .postSignIn:
            return .post
        }
    }
    
    var header: HeaderType {
        switch self {
        case .postSignUp, .postSignIn:
            return .basic
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .postSignUp(let name, let email, let password):
            return .requestBody(["name": name, "email": email, "password": password])
        case .postSignIn(let name, let email, let password):
            return .requestBody(["name": name, "email": email, "password": password])
        }
    }
}
