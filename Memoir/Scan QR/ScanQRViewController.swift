//
//  ScanQRViewController.swift
//  Memoir
//
//  Created by Antoine Simon on 30/07/2020.
//  Copyright © 2020 Antoine Simon. All rights reserved.
//

import UIKit

class ScanQRViewController: UIViewController {

    @IBOutlet weak var loginGuestButton: UIButton!
    @IBOutlet weak var loginWedButton: UIButton!
    
    private var viewModel = ScanQRViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
    }
    
    func setUp() {
        loginGuestButton.setTitle(viewModel.getGuestButtonTitle(), for: .normal)
        loginWedButton.setTitle(viewModel.getWedButtonTitle(), for: .normal)
    }
    
    @IBAction func LoginGuestPressed(_ sender: Any) {
//        navigationController?.pushViewController(LoginViewController(), animated: true)
    }
    
    @IBAction func LoginWedPressed(_ sender: Any) {
        navigationController?.pushViewController(LoginViewController(), animated: true)
    }
}
