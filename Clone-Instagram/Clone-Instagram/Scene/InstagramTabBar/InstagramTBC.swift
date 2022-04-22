//
//  InstagramTBC.swift
//  Clone-Instagram
//
//  Created by madilyn on 2022/04/22.
//

import UIKit

final class InstagramTBC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setTabBarController()
    }
    
    private func configureUI() {
//        self.tabBar.tintColor = .black
        self.tabBar.backgroundColor = .white
    }
    
    private func setTabBarController() {
        let homeVC = HomeVC()
        let searchVC = SearchVC()
        let reelsVC = ReelsVC()
        let shopVC = ShopVC()
        let mypageVC = MypageVC()
        
        homeVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "icn_home"), selectedImage: UIImage(named: "icn_home_selected"))
        searchVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "icn_search"), selectedImage: UIImage(named: "icn_search_selected"))
        reelsVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "icn_reels"), selectedImage: UIImage(named: "icn_reels_selected"))
        shopVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "icn_shop"), selectedImage: UIImage(named: "icn_shop_selected"))
        mypageVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "icn_profile"), selectedImage: UIImage(named: "icn_profile_selected"))
        
        setViewControllers([homeVC, searchVC, reelsVC, shopVC, mypageVC], animated: true)
    }
}
