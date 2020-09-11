//
//  LoginGuestViewModel.swift
//  Memoir
//
//  Created by Antoine Simon on 31/07/2020.
//  Copyright © 2020 Antoine Simon. All rights reserved.
//

import Foundation
import Combine

final class LoginGuestViewModel {
    private var service: LoginGuestServiceProtocol
    var cancellable: AnyCancellable?
    @Published var roomModel: RoomModel?
    @Published var displayError: Bool = false
    
    init(service: LoginGuestServiceProtocol = LoginGuestService()) {
        self.service = service
    }
    
    func getEnterRoomButtonTitle() -> String {
        return "login_guest_enter_button".localizedString
    }
    
    func resetDisplayError() {
        displayError = false
    }
    
    // TODO: return failure or success
    func loginRoom(room: String) {
        cancellable = service.enterRoom(roomNumber: room)
            .sink(receiveCompletion: { (error) in
                print(error)
                self.displayError = true
            }) { (result) in
                switch result {
                case let .failure(error):
                    print(error)
                    self.displayError = true
                case let .success(model):
                    print("Success \(model)")
                    self.roomModel = model
                }
        }
    }
}
