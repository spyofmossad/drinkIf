//
//  TransparentNavigationController.swift
//  DrinkIf
//
//  Created by Dmitry on 24.05.2020.
//  Copyright © 2020 Dmitry Navitski. All rights reserved.
//

import UIKit

class TransparentNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
        self.view.backgroundColor = UIColor.clear
    }
}
