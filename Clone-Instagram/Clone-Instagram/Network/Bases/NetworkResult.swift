//
//  NetworkResult.swift
//  Clone-Instagram
//
//  Created by madilyn on 2022/06/10.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
