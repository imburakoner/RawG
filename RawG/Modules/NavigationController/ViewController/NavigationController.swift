//
//  NavigationController.swift
//  RawG
//
//  Created by Burak Oner on 16.11.2021.
//

import UIKit

final class NavigationController: UINavigationController {

    init(with rootViewController: UIViewController) {
        super.init(navigationBarClass: NavigationBar.self, toolbarClass: nil)
        self.viewControllers = [rootViewController]
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
