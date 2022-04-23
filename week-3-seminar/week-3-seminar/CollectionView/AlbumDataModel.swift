//
//  AlbumDataModel.swift
//  week-3-seminar
//
//  Created by madilyn on 2022/04/23.
//

import Foundation

struct AlbumDataModel {
    let albumImageName: String
    let albumTitle: String
    let albumSinger: String
}

extension AlbumDataModel {
    static let dummyData: [AlbumDataModel] = [
        AlbumDataModel(albumImageName: "album1", albumTitle: "asdf", albumSinger: "asdf"),
        AlbumDataModel(albumImageName: "album2", albumTitle: "asdf", albumSinger: "asdf"),
        AlbumDataModel(albumImageName: "album3", albumTitle: "asdf", albumSinger: "asdf"),
        AlbumDataModel(albumImageName: "album4", albumTitle: "asdf", albumSinger: "asdf"),
        AlbumDataModel(albumImageName: "album5", albumTitle: "asdf", albumSinger: "asdf"),
        AlbumDataModel(albumImageName: "album6", albumTitle: "asdf", albumSinger: "asdf"),
    ]
}
