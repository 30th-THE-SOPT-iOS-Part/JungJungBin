//
//  BaseVC.swift
//  Clone-Instagram
//
//  Created by madilyn on 2022/04/09.
//

import UIKit

class BaseVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    func hideNavigationBar() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func pop() {
        self.navigationController?.popViewController(animated: true)
    }
}
