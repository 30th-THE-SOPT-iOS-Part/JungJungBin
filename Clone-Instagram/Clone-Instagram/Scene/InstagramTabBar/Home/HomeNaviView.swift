//
//  HomeNaviView.swift
//  Clone-Instagram
//
//  Created by madilyn on 2022/05/06.
//

import UIKit
import SnapKit
import Then

final class HomeNaviView: UIView {
    
    // MARK: Properties
    private let logoImgView = UIImageView().then {
        $0.image = UIImage(named: "Instagram_logo")
        $0.contentMode = .scaleAspectFit
    }
    
    private let btnStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.spacing = 16
    }
    
    private let addBtn = UIButton().then {
        $0.setImage(UIImage(named: "Add"), for: .normal)
        $0.contentMode = .scaleAspectFit
    }
    
    private let likeBtn = UIButton().then {
        $0.setImage(UIImage(named: "Like"), for: .normal)
        $0.contentMode = .scaleAspectFit
    }
    
    private let DMBtn = UIButton().then {
        $0.setImage(UIImage(named: "Share"), for: .normal)
        $0.contentMode = .scaleAspectFit
    }
    
    override func draw(_ rect: CGRect) {
        configureUI()
    }
    
    private func configureUI() {
        addSubviews([logoImgView, btnStackView, addBtn, likeBtn, DMBtn])
        
        [addBtn, likeBtn, DMBtn].forEach {
            self.btnStackView.addArrangedSubview($0)
        }
        
        logoImgView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(9)
            $0.leading.equalToSuperview().offset(14)
            $0.width.equalTo(96)
        }
        
        btnStackView.snp.makeConstraints {
            $0.top.bottom.equalTo(logoImgView)
            $0.trailing.equalToSuperview().inset(14)
            $0.width.equalTo(104)
        }
    }
}
