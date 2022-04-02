//
//  ViewController.swift
//  week-1-seminar
//
//  Created by madilyn on 2022/04/02.
//

import UIKit

@IBDesignable
class ViewController: UIViewController {

    // MARK: @IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel! {
        didSet {
            contentLabel.text = "도착한 메시지가 없어요!"
        }
    }
    @IBOutlet weak var finishBtn: UIButton! {
        didSet {
            finishBtn.layer.borderWidth = 1
            finishBtn.layer.borderColor = UIColor.black.cgColor
            finishBtn.layer.cornerRadius = 8
        }
    }
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: tapFinishBtn()
    @IBAction func tapFinishBtn(_ sender: Any) {
        contentLabel.text = "새로운 메시지가 도착했어요! ✉️"
        contentLabel.textColor = .red
    }
}

// MARK: - UI
extension ViewController {
    func configureUI() {
    }
}
