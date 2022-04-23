//
//  TargetVC.swift
//  week-3-seminar
//
//  Created by madilyn on 2022/04/23.
//

import UIKit

protocol TargetVCDelegate {
    func sendData(data: String)
}

class TargetVC: UIViewController {
    static let ID = "TargetVC"
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sendDataBtn: UIButton!
    
    var delegate: TargetVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapSendDataBtn(_ sender: Any) {
        if let text = textField.text {
            delegate?.sendData(data: text)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
}
