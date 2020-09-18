//
//  BookViewModel.swift
//  Memoir
//
//  Created by Antoine Simon on 11/09/2020.
//  Copyright © 2020 Antoine Simon. All rights reserved.
//

import Foundation
import Combine

class BookViewModel: ObservableObject {
//    private let service: BookServiceProtocol
    var cancellable: AnyCancellable?
//    @Published var roomModel: RoomDetails?
//    
//    init(service: BookServiceProtocol = BookService()) {
//        self.service = service
//    }
//    
//    func getRoomsDetails(userID: String, accessToken: String) {
//        cancellable = service.getRooms(userID: userID, accessToken: accessToken).sink(receiveCompletion: { (error) in
//            print(error)
//        }, receiveValue: { (result) in
//            switch result {
//            case let .failure(error):
//                print(error)
//            case let .success(model):
//                self.roomModel = model
//            }
//        })
//    }
}

