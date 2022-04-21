//
//  TextFieldShowBtn.swift
//  Clone-Instagram
//
//  Created by madilyn on 2022/04/22.
//

import UIKit
import Then
import SnapKit

final class TextFieldShowBtn: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setDefaultStyle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setDefaultStyle()
    }
    
    // MARK: Custom Methods
    private func setDefaultStyle() {
        setImage(UIImage.init(systemName: "eye"), for: .normal)
        setImage(UIImage.init(systemName: "eye.slash"), for: .selected)
        tintColor = .systemGray
    }
    
    func setConstraints(targetView: UIView) {
        self.snp.makeConstraints {
            $0.top.equalTo(targetView.snp.top).offset(8)
            $0.trailing.equalTo(targetView.snp.trailing)
            $0.bottom.equalTo(targetView.snp.bottom).inset(8)
            $0.width.equalTo(targetView.snp.height)
        }
    }
    
    func setShowBtn(targetTextField: UITextField) {
        press {
            self.isSelected.toggle()
            targetTextField.isSecureTextEntry = self.isSelected
        }
    }
}
