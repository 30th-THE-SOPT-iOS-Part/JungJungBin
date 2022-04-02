//
//  ViewController.swift
//  week-1-seminar
//
//  Created by madilyn on 2022/04/02.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    static let ID = "ViewController"
    
    // MARK: @IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var updateBtn: UIButton!
    @IBOutlet weak var enterFirstViewBtn: UIButton!
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: configureUI()
    func configureUI() {
        contentLabel.text = "도착한 메시지가 없어요!"
        contentLabel.sizeToFit()
        
        [updateBtn, enterFirstViewBtn].forEach { btn in
            btn?.layer.borderWidth = 1
            btn?.layer.borderColor = UIColor.black.cgColor
            btn?.layer.cornerRadius = 8
        }
    }
    
    // MARK: tapUpdateBtn()
    @IBAction func tapUpdateBtn(_ sender: Any) {
        contentLabel.text = "새로운 메시지가 도착했어요! ✉️"
        contentLabel.textColor = .red
        contentLabel.sizeToFit()
        AudioServicesPlayAlertSound(SystemSoundID(1307))
    }
    
    // MARK: tapEnterFirstViewBtn()
    @IBAction func tapEnterFirstViewBtn(_ sender: Any) {
        guard let firstVC = self.storyboard?.instantiateViewController(withIdentifier: FirstViewController.ID) else { return }
        self.present(firstVC, animated: true, completion: nil)
    }
}
