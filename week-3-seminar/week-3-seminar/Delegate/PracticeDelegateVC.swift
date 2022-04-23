//
//  PracticeDelegateVC.swift
//  week-3-seminar
//
//  Created by madilyn on 2022/04/23.
//

import UIKit

class PracticeDelegateVC: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
    }
}

extension PracticeDelegateVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("텍스트필드 편집 시작")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Return 버튼 눌림")
        textField.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("텍스트필드 편집 끝")
    }
}
