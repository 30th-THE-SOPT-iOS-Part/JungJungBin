//
//  ViewController.swift
//  week-1-seminar
//
//  Created by madilyn on 2022/04/02.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    // MARK: @IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var finishBtn: UIButton!
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: configureUI()
    func configureUI() {
        contentLabel.text = "도착한 메시지가 없어요!"
        contentLabel.sizeToFit()
        
        finishBtn.layer.borderWidth = 1
        finishBtn.layer.borderColor = UIColor.black.cgColor
        finishBtn.layer.cornerRadius = 8
    }
    
    // MARK: tapFinishBtn()
    @IBAction func tapFinishBtn(_ sender: Any) {
        contentLabel.text = "새로운 메시지가 도착했어요! ✉️"
        contentLabel.textColor = .red
        contentLabel.sizeToFit()
        AudioServicesPlayAlertSound(SystemSoundID(1307))
    }
}
