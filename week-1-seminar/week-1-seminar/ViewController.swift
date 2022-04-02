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
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var enterFirstViewBtn: UIButton!
    @IBOutlet weak var enterSecondViewBtn: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: configureUI()
    func configureUI() {
        contentLabel.text = "도착한 메시지가 없어요!"
        contentLabel.sizeToFit()
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 8
        [updateBtn, enterFirstViewBtn, enterSecondViewBtn, sendBtn].forEach { btn in
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
        firstVC.modalPresentationStyle = .fullScreen
        self.present(firstVC, animated: true, completion: nil)
    }
    
    // MARK: tapEnterSecondViewBtn()
    @IBAction func tapEnterSecondViewBtn(_ sender: Any) {
        guard let secondVC = self.storyboard?.instantiateViewController(withIdentifier: SecondViewController.ID) else { return }
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    // MARK: tapSendBtn()
    @IBAction func tapSendBtn(_ sender: Any) {
        guard let firstVC = self.storyboard?.instantiateViewController(withIdentifier: FirstViewController.ID) as? FirstViewController else { return }
        
        firstVC.modalPresentationStyle = .fullScreen
        firstVC.message = self.textField.text
        
        self.present(firstVC, animated: true, completion: nil)
    }
}
