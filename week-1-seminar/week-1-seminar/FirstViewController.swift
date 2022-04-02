//
//  FirstViewController.swift
//  week-1-seminar
//
//  Created by madilyn on 2022/04/02.
//

import UIKit

class FirstViewController: UIViewController {
    static let ID = "FirstViewController"
    
    // MARK: @IBOutlet
    @IBOutlet weak var contentLabel: UILabel!
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: tapBackBtn()
    @IBAction func tapBackBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
