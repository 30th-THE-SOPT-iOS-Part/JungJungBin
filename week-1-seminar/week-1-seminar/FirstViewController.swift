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
    
    // MARK: Properties
    var message: String?
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setMessage()
    }
    
    // MARK: tapBackBtn()
    @IBAction func tapBackBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    private func setMessage() {
        if let message = message { // 옵셔널 바인딩! message가 옵셔녈이므로
            contentLabel.text = message
            contentLabel.sizeToFit()
        }
    }
}
