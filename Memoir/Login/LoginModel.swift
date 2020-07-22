//
//  LoginModel.swift
//  Memoir
//
//  Created by Antoine Simon on 22/07/2020.
//  Copyright © 2020 Antoine Simon. All rights reserved.
//

import Foundation

struct LoginModel: Decodable {
    var Id: String
    var Username: String
}

struct LoginInfoModel: Encodable {
    var email: String
    var password: String
}
