//
//  LoginGuestModel.swift
//  Memoir
//
//  Created by Antoine Simon on 31/07/2020.
//  Copyright © 2020 Antoine Simon. All rights reserved.
//

import Foundation

struct RoomModel: Codable {
    var id: String
    var name: String
    var qrSource: String
    
}

struct GetRoomsModel: Encodable {
    var id: String
}

