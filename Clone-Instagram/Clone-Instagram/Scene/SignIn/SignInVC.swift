//
//  SignInVC.swift
//  Clone-Instagram
//
//  Created by madilyn on 2022/04/08.
//

import UIKit
import Then
import SnapKit

class SignInVC: BaseVC {
    
    // MARK: Properties
    private let logoImgView = UIImageView().then {
        $0.image = UIImage(named: "Instagram_logo")
        $0.contentMode = .scaleAspectFit
    }
    private let userNameTextField = DefaultTextField().then {
        $0.placeholder = "전화번호, 사용자 이름 또는 이메일"
    }
    private let passwordTextField = DefaultTextField().then {
        $0.placeholder = "비밀번호"
    }
    private let forgetBtn = UIButton().then {
        $0.setTitle("비밀번호를 잊으셨나요?", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        $0.contentHorizontalAlignment = .trailing
    }
    private let signInBtn = BlueBtnWithText().then {
        $0.setTitle("로그인", for: .normal)
    }
    private let noAccountLabel = UILabel().then {
        $0.text = "계정이 없으신가요?"
        $0.textColor = .systemGray2
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.sizeToFit()
    }
    private let signUpBtn = UIButton().then {
        $0.setTitle("가입하기", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 12)
    }
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setTapSignUpBtn()
        setTapSignInBtn()
        hideNavigationBar()
    }
    
    private func setTapSignUpBtn() {
        signUpBtn.press {
            let signUpUserNameVC = SignUpVC()
            signUpUserNameVC.signUpViewType = .makeUserName
            self.navigationController?.pushViewController(signUpUserNameVC, animated: true)
        }
    }
    
    private func setTapSignInBtn() {
        signInBtn.press {
            if let userName = self.userNameTextField.text {
                let welcomeVC = WelcomeVC()
                welcomeVC.userName = userName
                self.present(welcomeVC, animated: true)
            }
        }
    }
}

// MARK: - UI
extension SignInVC {
    private func configureUI() {
        view.addSubviews([logoImgView, userNameTextField, passwordTextField, forgetBtn, signInBtn, noAccountLabel, signUpBtn])
        
        logoImgView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(80)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(40)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-40)
            $0.height.equalTo(80)
        }
        
        userNameTextField.snp.makeConstraints {
            $0.top.equalTo(logoImgView.snp.bottom).offset(20)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
            $0.height.equalTo(40)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(userNameTextField.snp.bottom).offset(20)
            $0.leading.equalTo(userNameTextField.snp.leading)
            $0.trailing.equalTo(userNameTextField.snp.trailing)
            $0.height.equalTo(userNameTextField.snp.height)
        }
        
        forgetBtn.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(8)
            $0.width.equalTo(200)
            $0.trailing.equalTo(userNameTextField.snp.trailing)
            $0.height.equalTo(18)
        }
        
        signInBtn.snp.makeConstraints {
            $0.top.equalTo(forgetBtn.snp.bottom).offset(20)
            $0.leading.equalTo(userNameTextField.snp.leading)
            $0.trailing.equalTo(userNameTextField.snp.trailing)
            $0.height.equalTo(userNameTextField.snp.height)
        }
        
        noAccountLabel.snp.makeConstraints {
            $0.top.equalTo(signInBtn.snp.bottom).offset(20)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(120)
        }
        
        signUpBtn.snp.makeConstraints {
            $0.leading.equalTo(noAccountLabel.snp.trailing).offset(2)
            $0.centerY.equalTo(noAccountLabel.snp.centerY)
            $0.height.equalTo(noAccountLabel.snp.height)
            $0.width.equalTo(50)
        }
    }
}
