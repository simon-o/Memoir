//
//  LoginViewModel.swift
//  Memoir
//
//  Created by Antoine Simon on 22/07/2020.
//  Copyright © 2020 Antoine Simon. All rights reserved.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    private let service: LoginServiceProtocol
    private let userDefault: UserDefaults
    var cancellableLoginUser: AnyCancellable?
    var cancellableSaveToken: AnyCancellable?
    @Published var loginModel: LoginModel?
    
    init(service: LoginServiceProtocol = LoginService(), userDefault: UserDefaults = .standard) {
        self.service = service
        self.userDefault = userDefault
        
        cancellableSaveToken = $loginModel.receive(on: DispatchQueue.main)
            .map {return ($0?.Id ?? "", $0?.Token ?? "") }
            .sink(receiveValue: { (result) in
                self.save(token: result.1, userID: result.0)
            })
    }
    
    private func save(token: String, userID: String) {
        if !token.isEmpty && !userID.isEmpty {
            userDefault.save(token: token, userID: userID)
        }
    }
    
    func loginUser(email: String, password: String) {
        cancellableLoginUser = service.loginUser(email: email, password: password).sink(receiveCompletion: { (error) in
            print(error)
        }, receiveValue: { (result) in
            switch result {
            case let .failure(error):
                print(error)
            case let .success(model):
                print("Success \(model)")
                self.loginModel = model
            }
        })
    }
    
    func getLoginButtonTitle() -> String {
        return "login_login_button".localizedString
    }
    
    func getPasswordButtonTitle() -> String {
        return "login_password_button".localizedString
    }
}
