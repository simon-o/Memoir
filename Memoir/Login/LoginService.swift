//
//  File.swift
//  Memoir
//
//  Created by Antoine Simon on 22/07/2020.
//  Copyright © 2020 Antoine Simon. All rights reserved.
//

import Foundation
import Combine

enum Error: Swift.Error {
    case network(URLError)
    case unknown(URLResponse)
}

protocol LoginServiceProtocol {
    func loginUser(email: String, password: String) -> AnyPublisher<Result<LoginModel, Error>, URLError>
    func getRooms(userID: String, accessToken: String) -> AnyPublisher<Result<RoomDetails, Error>, URLError>
}

class LoginService: LoginServiceProtocol {
    func loginUser(email: String, password: String) -> AnyPublisher<Result<LoginModel, Error>, URLError> {
        return URLSession.shared.dataTaskPublisher(for: UrlFactory().makeURL(type: .post, apiPath: .login, parameters: LoginInfoModel(email: email, password: password)))
            .map { (data, response) -> Result<LoginModel, Error> in
                if let decoded = try? JSONDecoder().decode(LoginModel.self, from: data) {
                    return .success(decoded)
                }
                // MARK: Need to be replaced with data to send the error message
                return .failure(.unknown(response))
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
    
    func getRooms(userID: String, accessToken: String) -> AnyPublisher<Result<RoomDetails, Error>, URLError> {
           return URLSession.shared.dataTaskPublisher(for: UrlFactory().makeURL(type: .get, apiPath: String(format: apiPath.roomList.rawValue, userID), accessToken: accessToken, parameters: GetRoomsModel(id: "")))
               .map { (data, response) -> Result<RoomDetails, Error> in
                   if let decoded = try? JSONDecoder().decode(RoomDetails.self, from: data) {
                       return .success(decoded)
                   }
                   // MARK: Need to be replaced with data to send the error message
                   return .failure(.unknown(response))
           }
           .receive(on: DispatchQueue.main)
           .eraseToAnyPublisher()
       }
}
