//
//  NetworkConstants.swift
//  Clone-Instagram
//
//  Created by madilyn on 2022/06/10.
//

import Foundation
import Alamofire

/*
 NetworkConstants : 서버통신과정에서 필요한 상수들을 관리 -> header 관련 상수들
 */

enum HeaderType {
    case basic
    case auth
    case multiPart
    case multiPartWithAuth
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case accesstoken = "accesstoken"
}

enum ContentType: String {
    case json = "Application/json"
    case tokenSerial = ""
    case multiPart = "multipart/form-data"
}
