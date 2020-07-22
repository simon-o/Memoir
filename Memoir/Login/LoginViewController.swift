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
    
    
    private var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: DEBUG
        emailTextfield.text = "antoine.simon.epitech@gmail.com"
        passwordTextfield.text = "aseax45632memoir"
    }
    
    @IBAction func LoginPressed(_ sender: Any) {
        viewModel.loginUser(email: emailTextfield.text ?? "", password: passwordTextfield.text ?? "")
    }
    
    @IBAction func PasswordForgottenPressed(_ sender: Any) {
        
    }
}
