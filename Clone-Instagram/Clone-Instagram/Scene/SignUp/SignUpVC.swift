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

final class SignUpVC: BaseVC {
    
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
    private let textField = DefaultTextField().then {
        $0.clearButtonMode = .whileEditing
    }
    private let nextBtn = BlueBtnWithText().then {
        $0.setTitle("다음", for: .normal)
        $0.isEnabled = false
    }
    
    var signUpViewType: SignUpViewType = .makeUserName
    var userName = ""
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setUIForViewType()
        setTapNextBtn()
        setTapBackBtn()
        setTextFieldDidChangeTarget(textField: textField)
    }
    
    private func setTapBackBtn() {
        backBtn.press { [weak self] in
            self?.pop()
        }
    }
    
    private func setTapNextBtn() {
        nextBtn.press { [weak self] in
            switch self?.signUpViewType {
            case .makeUserName:
                if let userName = self?.textField.text {
                    let signUpPasswordVC = SignUpVC()
                    signUpPasswordVC.signUpViewType = .makePassword
                    signUpPasswordVC.userName = userName
                    self?.navigationController?.pushViewController(signUpPasswordVC, animated: true)
                }
            case .makePassword:
                self?.requestSignUp(body: SignBodyModel(name: self?.userName ?? "", email: self?.userName ?? "", password: self?.textField.text ?? ""), completion: { userName in
                    let welcomeVC = WelcomeVC()
                    welcomeVC.modalPresentationStyle = .fullScreen
                    welcomeVC.userName = userName
                    self?.present(welcomeVC, animated: true)
                    self?.navigationController?.popToRootViewController(animated: true)
                })
            case .none:
                return
            }
        }
    }
    
    private func setTextFieldDidChangeTarget(textField: UITextField) {
        textField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
    }
    
    @objc
    private func textFieldDidChange(textField: UITextField){
        nextBtn.isEnabled = textField.hasText
    }
}

// MARK: - Network
extension SignUpVC {
    private func requestSignUp(body: SignBodyModel, completion: @escaping (String) -> (Void)) {
        SignAPI.shared.postSignUp(body: body) { networkResult in
            switch networkResult {
            case .success:
                completion(body.name)
            default:
                debugPrint(networkResult)
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
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).inset(16)
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.leading.equalTo(titleLabel.snp.leading).offset(40)
            $0.trailing.equalTo(titleLabel.snp.trailing).inset(40)
        }
        
        textField.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(22)
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
