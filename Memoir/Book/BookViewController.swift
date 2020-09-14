//
//  BookViewController.swift
//  Memoir
//
//  Created by Antoine Simon on 11/09/2020.
//  Copyright © 2020 Antoine Simon. All rights reserved.
//

import UIKit
import Combine

class BookViewController: UIViewController {

    private var viewModel = BookViewModel()
    private var cancellable: AnyCancellable?
    private let id: String
    private let accessToken: String
    
    init(userID: String, accessToken: String) {
        self.id = userID
        self.accessToken = accessToken
        super.init(nibName: String(describing: BookViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
        fetchRooms()
    }
    
    func setUp() {
//        cancellable = viewModel.$roomModel.receive(on: DispatchQueue.main)
//        .map {$0?.Id}
//        .assign(to: \.text, on: label)
    }
    
    func fetchRooms() {
        viewModel.getRoomsDetails(userID: id, accessToken: accessToken)
    }
}
