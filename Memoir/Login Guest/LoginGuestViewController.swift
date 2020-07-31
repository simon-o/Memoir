//
//  LoginGuestViewController.swift
//  Memoir
//
//  Created by Antoine Simon on 31/07/2020.
//  Copyright © 2020 Antoine Simon. All rights reserved.
//

import UIKit

class LoginGuestViewController: UIViewController {
    @IBOutlet private weak var enterButton: UIButton!
    @IBOutlet private weak var roomTextField: UITextField!
    
    private var viewModel: LoginGuestViewModel = LoginGuestViewModel()
    private var roomNumber: String
    
    init(roomNumber: String = "") {
        self.roomNumber = roomNumber
        
        super.init(nibName: String(describing: LoginGuestViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp() {
        enterButton.setTitle(viewModel.getEnterRoomButtonTitle(), for: .normal)
    }
    
    @IBAction func enterRoomButtonPressed(_ sender: Any) {
        viewModel.loginRoom(room: roomTextField.text ?? "")
    }
}
