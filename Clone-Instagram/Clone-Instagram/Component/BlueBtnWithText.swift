//
//  BlueBtnWithText.swift
//  Clone-Instagram
//
//  Created by madilyn on 2022/04/10.
//

import UIKit

class BlueBtnWithText: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setDefaultStyle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setDefaultStyle()
    }
    
    override var isEnabled: Bool {
        didSet {
            self.backgroundColor = isEnabled ? .systemBlue : .systemBlue.withAlphaComponent(0.5)
        }
    }
    
    // MARK: Private Methods
    private func setDefaultStyle() {
        self.layer.cornerRadius = 8
        self.setTitleColor(.white, for: .normal)
        self.setTitleColor(.white, for: .disabled)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        self.isEnabled = true
    }
}
