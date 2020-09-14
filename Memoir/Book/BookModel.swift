//
//  BookModel.swift
//  Memoir
//
//  Created by Antoine Simon on 11/09/2020.
//  Copyright © 2020 Antoine Simon. All rights reserved.
//

import Foundation

struct RoomDetails: Codable {
    var id: String
    var name: String
//    var qrSource: String?
//    var guest: [RoomGuest]
//    var book: BookDetails
//    var liveWall: LiveWallDetails
}

struct RoomGuest: Codable {
    var id: String
    var name: String
}

struct BookDetails: Codable {
    var id: String
}

struct LiveWallDetails: Codable {
    var id: String
}
