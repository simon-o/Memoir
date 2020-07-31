//
//  LoginGuestService.swift
//  Memoir
//
//  Created by Antoine Simon on 31/07/2020.
//  Copyright © 2020 Antoine Simon. All rights reserved.
//

import Foundation
import Combine

protocol LoginGuestServiceProtocol {
    func enterRoom(roomNumber: String) -> AnyPublisher<Result<RoomModel, Error>, URLError>
}

class LoginGuestService: LoginGuestServiceProtocol {
    func enterRoom(roomNumber: String) -> AnyPublisher<Result<RoomModel, Error>, URLError> {
        
        return URLSession.shared.dataTaskPublisher(for: UrlFactory().makeURL(type: .get, apiPath: String(format: apiPath.room.rawValue, roomNumber), parameters: GetRoomsModel(id: roomNumber)))
            .map{ (data, response) -> Result<RoomModel, Error> in
                if let decoded = try? JSONDecoder().decode(RoomModel.self, from: data) {
                    return .success(decoded)
                }
                return .failure(.unknown(response))
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}
