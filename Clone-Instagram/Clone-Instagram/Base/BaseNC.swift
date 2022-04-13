//
//  BaseNC.swift
//  Clone-Instagram
//
//  Created by madilyn on 2022/04/10.
//

import UIKit

class BaseNC: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
}

extension BaseNC: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return self.viewControllers.count > 1
    }
}
