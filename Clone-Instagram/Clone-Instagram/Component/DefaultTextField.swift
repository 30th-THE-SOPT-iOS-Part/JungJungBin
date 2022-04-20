//
//  DefaultTextField.swift
//  Clone-Instagram
//
//  Created by madilyn on 2022/04/10.
//

import UIKit

class DefaultTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setDefaultStyle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setDefaultStyle()
    }
    
    // MARK: Private Methods
    private func setDefaultStyle() {
        self.layer.cornerRadius = 8
        self.textColor = .systemGray
        self.font = UIFont.systemFont(ofSize: 12)
        self.addLeftPadding(16)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.systemGray5.cgColor
        self.backgroundColor = .systemGray6
        self.clearButtonMode = .whileEditing
    }
}
