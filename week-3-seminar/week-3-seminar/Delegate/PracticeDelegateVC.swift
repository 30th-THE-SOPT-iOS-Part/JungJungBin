//
//  PracticeDelegateVC.swift
//  week-3-seminar
//
//  Created by madilyn on 2022/04/23.
//

import UIKit

class PracticeDelegateVC: UIViewController {
    static let ID = "PracticeDelegateVC"
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func tapNextBtn(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: TargetVC.ID) as? TargetVC else { return }
        nextVC.delegate = self
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

extension PracticeDelegateVC: TargetVCDelegate {
    func sendData(data: String) {
        self.label.text = data
    }
}
