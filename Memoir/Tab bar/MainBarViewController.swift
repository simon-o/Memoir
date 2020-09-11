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

        let view1 = BookViewController(userID: "5f216724d2ded34ce6e5977e")
        view1.tabBarItem = UITabBarItem(title: "BOOK", image: nil, tag: 0)
        let view2 = UIViewController()
        view2.view.backgroundColor = .red
        view2.tabBarItem = UITabBarItem(title: "RED", image: nil, tag: 1)
        
        viewControllers = [view1, view2]
    }
}
