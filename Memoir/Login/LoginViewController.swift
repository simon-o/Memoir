//
//  LoginViewController.swift
//  Memoir
//
//  Created by Antoine Simon on 22/07/2020.
//  Copyright © 2020 Antoine Simon. All rights reserved.
//

import UIKit
import Combine

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordButton: UIButton!
    
    @IBOutlet weak var label: UILabel!
    
    private var viewModel = LoginViewModel()
    private var cancellable: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: DEBUG
        emailTextfield.text = "antoine.simon.epitech@gmail.com"
        passwordTextfield.text = "aseax45632memoir"
        
        setUp()
    }
    
    func setUp() {
        initPublish()
        loginButton.setTitle(viewModel.getLoginButtonTitle(), for: .normal)
        passwordButton.setTitle(viewModel.getPasswordButtonTitle(), for: .normal)
    }
    
    func initPublish() {
        cancellable = viewModel.$roomModel.receive(on: DispatchQueue.main)
            .sink(receiveValue: { result in
                if let result = result {
                    self.loginSuccessful()
                }
            })
        
        cancellable = viewModel.$errorModel.receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { result in
                print(result)
//                print(result?.localizedDescription)
//                if let result = result {
//                    display alert
//                }
            }, receiveValue: {result in
                print(result as Any)
            })
    }
    
    func loginSuccessful() {
        navigationController?.pushViewController(MainBarViewController(), animated: true)
    }
    
    @IBAction func LoginPressed(_ sender: Any) {
        viewModel.loginUser(email: emailTextfield.text ?? "", password: passwordTextfield.text ?? "")
    }
    
    @IBAction func PasswordForgottenPressed(_ sender: Any) {
        loginSuccessful()
    }
}
