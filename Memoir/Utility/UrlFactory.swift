//
//  UrlFactory.swift
//  Memoir
//
//  Created by Antoine Simon on 22/07/2020.
//  Copyright © 2020 Antoine Simon. All rights reserved.
//

import Foundation

enum typeUrl: String {
    case post = "POST"
    case get = "GET"
}

enum apiPath: String {
    case login = "users/authenticate"
    case room = "rooms/%@"
}

struct UrlFactory {
    private let baseUrl = "https://memoir.jracaud.com/api/"
    func makeURL<T>(type: typeUrl, apiPath: apiPath, parameters: T?) -> URLRequest where T : Encodable{
         
        return makeURL(type: type, apiPath: apiPath.rawValue, parameters: parameters)
    }
    
    func makeURL<T>(type: typeUrl, apiPath: String, parameters: T?) -> URLRequest where T : Encodable{
         
        var request = URLRequest(url: URL(string: baseUrl + apiPath)!)
        request.httpMethod = type.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if type != .get {
            request.httpBody = try! JSONEncoder().encode(parameters)
        }
        return request
    }
}
