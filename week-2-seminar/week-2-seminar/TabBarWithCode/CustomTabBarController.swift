//
//  CustomTabBarController.swift
//  week-2-seminar
//
//  Created by madilyn on 2022/04/17.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarController()
    }
    
    func setTabBarController() {
        guard let firstVC = self.storyboard?.instantiateViewController(withIdentifier: FirstViewController.ID),
              let secondVC = self.storyboard?.instantiateViewController(withIdentifier: SecondViewController.ID)
        else { return }
        
        firstVC.tabBarItem = UITabBarItem(title: "first", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        secondVC.tabBarItem = UITabBarItem(title: "second", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        
        setViewControllers([firstVC, secondVC], animated: true)
    }
}
