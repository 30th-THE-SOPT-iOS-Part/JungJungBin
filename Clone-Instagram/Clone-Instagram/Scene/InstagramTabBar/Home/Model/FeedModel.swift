//
//  FeedModel.swift
//  Clone-Instagram
//
//  Created by madilyn on 2022/05/16.
//

import Foundation

struct FeedModelElement {
    var profileImageName: String
    var userID: String
    var contentImageName: String
    var likeCount: Int
    var content: String
    var commentCount: Int
}

typealias FeedModel = [FeedModelElement]
