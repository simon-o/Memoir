//
//  File.swift
//  Memoir
//
//  Created by Antoine Simon on 22/07/2020.
//  Copyright © 2020 Antoine Simon. All rights reserved.
//

import Foundation
import Combine



protocol LoginServiceProtocol {
    func loginUser(email: String, password: String) -> AnyPublisher<LoginModel, Error>
}

class LoginService: LoginServiceProtocol {
    func loginUser(email: String, password: String) -> AnyPublisher<LoginModel, Error> {
        return URLSession.shared.dataTaskPublisher(for: UrlFactory().makeURL(type: .post, apiPath: .login, parameters: LoginInfoModel(email: email, password: password)))
            .map {$0.data}
            .decode(type: LoginModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
