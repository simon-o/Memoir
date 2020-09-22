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
    
    init(service: MediasServiceProtocol = MediasService()) {
        self.service = service
    }
}

