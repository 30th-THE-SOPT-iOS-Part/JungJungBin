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
    case postSignUp(body: SignBodyModel)
    case postSignIn(body: SignBodyModel)
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
        case .postSignUp(let body):
            return .requestBody(["name": body.name, "email": body.email, "password": body.password])
        case .postSignIn(let body):
            return .requestBody(["name": body.name, "email": body.email, "password": body.password])
        }
    }
}
