//
//  WelcomeVC.swift
//  Clone-Instagram
//
//  Created by madilyn on 2022/04/10.
//

import UIKit
import Then
import SnapKit

enum WelcomeViewType {
    case fromSignUp
    case fromSignIn
}

final class WelcomeVC: BaseVC {
    
    // MARK: Properties
    private let titleLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        $0.textAlignment = .center
        $0.numberOfLines = 2
    }
    private let contentLabel = UILabel().then {
        $0.text = "언제든지 연락처 정보와 사용자 이름을 변경할 수 있습니다."
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.textAlignment = .center
    }
    private let completeBtn = BlueBtnWithText().then {
        $0.setTitle("완료하기", for: .normal)
    }
    private let otherSignInBtn = UIButton().then {
        $0.setTitle("다른 계정으로 로그인하기", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
    }
    
    var welcomeViewType: WelcomeViewType = .fromSignIn
    var signData: SignBodyModel?
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setTitleLabel()
        setTapCompleteBtn()
        setTapOtherSignInBtn()
    }
    
    private func setTapCompleteBtn() {
        completeBtn.press { [weak self] in
            switch self?.welcomeViewType {
            case .fromSignUp:
                self?.requestSignUp(body: self?.signData ?? SignBodyModel(name: "", email: "", password: ""), completion: { userName in
                    self?.makeAlert(title: "회원가입 성공", message: "", okTitle: "확인", okAction: { alert in
                        self?.dismiss(animated: true)
                    })
                })
            case .fromSignIn:
                self?.requestSignIn(body: self?.signData ?? SignBodyModel(name: "", email: "", password: ""), completion: { userName in
                    self?.makeAlert(title: "로그인 성공", message: "", okTitle: "확인", okAction: { alert in
                        let tabBar = InstagramTBC()
                        tabBar.modalPresentationStyle = .fullScreen
                        self?.present(tabBar, animated: true)
                    })
                })
            default:
                break
            }
        }
    }
    
    private func setTapOtherSignInBtn() {
        otherSignInBtn.press { [weak self] in
            self?.dismiss(animated: true)
        }
    }
}

// MARK: - Network
extension WelcomeVC {
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
    
    private func requestSignIn(body: SignBodyModel, completion: @escaping (String) -> (Void)) {
        SignAPI.shared.postSignIn(body: body) { networkResult in
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
extension WelcomeVC {
    private func configureUI() {
        view.addSubviews([titleLabel, contentLabel, completeBtn, otherSignInBtn])
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(310)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(75)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).inset(75)
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.equalTo(titleLabel.snp.leading).offset(-40)
            $0.trailing.equalTo(titleLabel.snp.trailing).inset(-40)
        }
        
        completeBtn.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(20)
            $0.leading.equalTo(titleLabel.snp.leading).offset(-38)
            $0.trailing.equalTo(titleLabel.snp.trailing).inset(-38)
            $0.height.equalTo(40)
        }
        
        otherSignInBtn.snp.makeConstraints {
            $0.top.equalTo(completeBtn.snp.bottom).offset(20)
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.trailing.equalTo(titleLabel.snp.trailing)
            $0.height.equalTo(17)
        }
    }
    
    private func setTitleLabel() {
        titleLabel.text =
"""
\(signData?.name ?? "")님, Instagram에
오신 것을 환영합니다.
"""
    }
}
