//
//  MainBarViewModel.swift
//  Memoir
//
//  Created by Antoine Simon on 18/09/2020.
//  Copyright © 2020 Antoine Simon. All rights reserved.
//

import Foundation
import Combine

class MainBarViewModel: ObservableObject {
    private let service: MediasServiceProtocol
    var cancellable: AnyCancellable?
    @Published var roomModel: RoomDetails?
    @Published var errorModel: Error?
    
    init(service: MediasServiceProtocol = MediasService()) {
        self.service = service
    }
    
    func getRoomsDetails(userID: String, accessToken: String) {
        cancellable = service.getRooms(userID: userID, accessToken: accessToken).sink(receiveCompletion: { (error) in
            print(error)
        }, receiveValue: { (result) in
            switch result {
            case let .failure(error):
                self.errorModel = error
            case let .success(model):
                self.roomModel = model
            }
        })
    }
}

