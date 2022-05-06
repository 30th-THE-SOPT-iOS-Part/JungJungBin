//
//  HomeVC.swift
//  Clone-Instagram
//
//  Created by madilyn on 2022/04/22.
//

import UIKit

class HomeVC: BaseVC {
    
    // MARK: Properties
    private let naviView = HomeNaviView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.addSubviews([naviView])
        
        naviView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
            $0.height.equalTo(44)
        }
    }
}
