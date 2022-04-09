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
    
    private func setTapNextBtn() {
        nextBtn.press {
            switch self.signUpViewType {
            case .makeUserName:
                let signUpPasswordVC = SignUpVC()
                signUpPasswordVC.signUpViewType = .makePassword
                self.navigationController?.pushViewController(signUpPasswordVC, animated: true)
            case .makePassword:
                let welcomeVC = BaseVC()
            }
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
    
    private func setUIForViewType() {
        switch signUpViewType {
        case .makeUserName:
            titleLabel.text = "사용자 이름 만들기"
            contentLabel.text = "새 계정에 사용할 사용자 이름을 선택하세요. 나중에 언제든지 변경할 수 있습니다."
            textField.placeholder = "사용자 이름"
        case .makePassword:
            titleLabel.text = "비밀번호 만들기"
            contentLabel.text = "비밀번호를 저장할 수 있으므로 iCloud 기기에서 로그인 정보를 입력하지 않아도 됩니다."
            textField.placeholder = "비밀번호"
        }
    }
}
