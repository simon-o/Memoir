//
//  LoginModel.swift
//  Memoir
//
//  Created by Antoine Simon on 22/07/2020.
//  Copyright © 2020 Antoine Simon. All rights reserved.
//

import Foundation

struct LoginModel: Codable {
    var Id: String
    var Username: String
    var Password: String?
    var Email: String
    var Role: String
    var Subscription: SubscriptionModel
    var Token: String
}

struct SubscriptionModel: Codable {
    var Id :String
    var Name: String
    var Price: Int
    var Recurring: Bool
    var UniqueRoom: Bool
    var Features: [FeatureModel]
}

struct FeatureModel: Codable {
    var Id: String
    var Name: String
    var Description: String
    var Enabled: Bool
    
}

struct LoginInfoModel: Encodable {
    var email: String
    var password: String
}
