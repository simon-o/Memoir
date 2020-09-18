//
//  Tools.swift
//  Memoir
//
//  Created by Antoine Simon on 30/07/2020.
//  Copyright © 2020 Antoine Simon. All rights reserved.
//

import Foundation

extension String {
    var localizedString: String {
        return NSLocalizedString(self, comment: "")
    }
}
extension UserDefaults {
    enum Constants {
        static let userID = "userID"
        static let token = "token"
    }
    
    func save(token: String, userID: String) {
        UserDefaults.standard.set(token, forKey: Constants.token)
        UserDefaults.standard.set(userID, forKey: Constants.userID)
    }
    
    func getTokenAndUserID() -> (String, String) {
        return (UserDefaults.standard.string(forKey: Constants.token) ?? "", UserDefaults.standard.string(forKey: Constants.userID) ?? "")
    }
}
