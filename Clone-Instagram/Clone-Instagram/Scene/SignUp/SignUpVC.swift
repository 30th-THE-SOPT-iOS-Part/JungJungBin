//
//  SignUpVC.swift
//  Clone-Instagram
//
//  Created by madilyn on 2022/04/10.
//

import UIKit
import Then
import SnapKit

enum SignUpViewType {
    case makeUserName
    case makePassword
}

class SignUpVC: BaseVC {
    
    // MARK: Properties
    private let backBtn = UIButton().then {
        $0.setImage(UIImage.init(systemName: "chevron.left"), for: .normal)
        $0.tintColor = .black
    }
    private let titleLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        $0.textAlignment = .center
    }
    private let contentLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.textAlignment = .center
        $0.numberOfLines = 2
    }
    private let textField = DefaultTextField()
    private let nextBtn = BlueBtnWithText().then {
        $0.setTitle("다음", for: .normal)
    }
    
    var signUpViewType: SignUpViewType = .makeUserName
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setUIForViewType()
        setTapNextBtn()
        setTapBackBtn()
    }
    
    private func setTapBackBtn() {
        backBtn.press {
            self.pop()
        }
    }
    
}

// MARK: - UI
extension SignUpVC {
    private func configureUI() {
        view.addSubviews([backBtn, titleLabel, contentLabel, textField, nextBtn])
        
        backBtn.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(8)
            $0.width.height.equalTo(36)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(backBtn.snp.bottom).offset(20)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.leading.equalTo(titleLabel.snp.leading).offset(40)
            $0.trailing.equalTo(titleLabel.snp.trailing).offset(-40)
        }
        
        textField.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(20)
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.trailing.equalTo(titleLabel.snp.trailing)
            $0.height.equalTo(40)
        }
        
        nextBtn.snp.makeConstraints {
            $0.top.equalTo(textField.snp.bottom).offset(20)
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.trailing.equalTo(titleLabel.snp.trailing)
            $0.height.equalTo(40)
        }
    }
    
    }
}
