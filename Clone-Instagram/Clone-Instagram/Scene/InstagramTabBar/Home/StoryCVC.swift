//
//  StoryCVC.swift
//  Clone-Instagram
//
//  Created by madilyn on 2022/05/06.
//

import UIKit

class StoryCVC: UICollectionViewCell {
    
    private let imageView = UIImageView()
    private let IDLabel = UILabel().then {
        $0.font = UIFont.boldSystemFont(ofSize: 10)
        $0.textAlignment = .center
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    private func configureUI() {
        contentView.addSubviews([imageView, IDLabel])
        
        imageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        
        IDLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(2)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    func setData(data: HomeStoryModelElement) {
        imageView.image = UIImage(named: data.profileImageName)
        IDLabel.text = data.userID
    }
}
