//
//  BookService.swift
//  Memoir
//
//  Created by Antoine Simon on 11/09/2020.
//  Copyright © 2020 Antoine Simon. All rights reserved.
//

import Foundation
import Combine

protocol BookServiceProtocol {
    func getRooms(userID: String, accessToken: String) -> AnyPublisher<Result<RoomDetails, Error>, URLError>
//    func getRoomDetails(roomID: String) -> AnyPublisher<Result<, Error>, URLError>
}

class BookService: BookServiceProtocol {
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
