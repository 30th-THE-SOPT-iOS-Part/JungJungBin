//
//  UIButton+.swift
//  Clone-Instagram
//
//  Created by madilyn on 2022/04/10.
//

import UIKit

extension UIButton {
    func press(vibrate: Bool = false, for controlEvents: UIControl.Event = .touchUpInside, _ closure: @escaping()->()) {
        self.addAction(UIAction { (action: UIAction) in closure()
        }, for: controlEvents)
    }
}
