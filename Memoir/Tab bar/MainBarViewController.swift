//
//  MainBarViewController.swift
//  Memoir
//
//  Created by Antoine Simon on 11/09/2020.
//  Copyright © 2020 Antoine Simon. All rights reserved.
//

import UIKit

class MainBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let view1 = BookViewController(userID: "5f180e45c1e2f947b45e306c", accessToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjVmMTgwZTQ1YzFlMmY5NDdiNDVlMzA2YyIsInJvbGUiOiJSZWd1bGFyIiwibmJmIjoxNTk5ODM2OTIyLCJleHAiOjE2MzEzNzI5MjIsImlhdCI6MTU5OTgzNjkyMn0.fgCYIWqs_KwaNtpzb8cf2sxhq5HQc1LPcQyFgXkAvFE")
        view1.tabBarItem = UITabBarItem(title: "BOOK", image: nil, tag: 0)
        let view2 = UIViewController()
        view2.view.backgroundColor = .red
        view2.tabBarItem = UITabBarItem(title: "RED", image: nil, tag: 1)
        
        viewControllers = [view1, view2]
    }
}
