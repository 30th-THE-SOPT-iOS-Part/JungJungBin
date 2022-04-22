//
//  WelcomeVC.swift
//  Clone-Instagram
//
//  Created by madilyn on 2022/04/10.
//

import UIKit
import Then
import SnapKit

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
    
    var userName = ""
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setTitleLabel()
        setTapCompleteBtn()
    }
    
    private func setTapCompleteBtn() {
        completeBtn.press { [weak self] in
            self?.dismiss(animated: true)
        }
    }
}

// MARK: - UI
extension WelcomeVC {
    private func configureUI() {
        view.addSubviews([titleLabel, contentLabel, completeBtn])
        
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
    }
    
    private func setTitleLabel() {
        titleLabel.text =
"""
\(userName)님, Instagram에
오신 것을 환영합니다.
"""
    }
}
