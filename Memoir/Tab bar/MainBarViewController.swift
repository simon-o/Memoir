//
//  MainBarViewController.swift
//  Memoir
//
//  Created by Antoine Simon on 11/09/2020.
//  Copyright © 2020 Antoine Simon. All rights reserved.
//

import UIKit
import Combine

class MainBarViewController: UITabBarController {
    private var viewModel = MainBarViewModel()
    private var cancellable: AnyCancellable?
    private var id: String?
    private var accessToken: String?
    private let bookView: BookViewController
    private let userDefault: UserDefaults
    
    init(userDefault: UserDefaults = .standard) {
        self.userDefault = userDefault
        bookView = BookViewController()
        super.init(nibName: String(describing: MainBarViewController.self), bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
    }
    
    func setUp() {
        parseUserInfos()
        
        bookView.tabBarItem = UITabBarItem(title: "BOOK", image: nil, tag: 0)
        let view2 = UIViewController()
        view2.view.backgroundColor = .red
        view2.tabBarItem = UITabBarItem(title: "RED", image: nil, tag: 1)
        
        viewControllers = [bookView, view2]
    }
    
    private func parseUserInfos() {
        let result = UserDefaults.standard.getTokenAndUserID()
        accessToken = result.0
        id = result.1
    }
}
