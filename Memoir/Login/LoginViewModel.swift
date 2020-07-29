//
//  LoginViewModel.swift
//  Memoir
//
//  Created by Antoine Simon on 22/07/2020.
//  Copyright © 2020 Antoine Simon. All rights reserved.
//

import Foundation
import Combine

protocol LoginViewModelProtocol {
    
}

class LoginViewModel: ObservableObject {
    private let service: LoginServiceProtocol = LoginService()
    var cancellable: AnyCancellable?
    @Published var loginModel: LoginModel?
    
    func loginUser(email: String, password: String) {
        cancellable = service.loginUser(email: email, password: password).sink(receiveCompletion: { (error) in
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
    
    func viewDidLoad() {
        
    }
}

extension LoginViewModel: LoginViewModelProtocol {
    
}
