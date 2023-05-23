//
//  TabBarController.swift
//  Market
//
//  Created by macbook on 18.05.2023.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.tintColor = .gray
        self.tabBar.isTranslucent = true
        
        viewControllers = [
            generatorNavigationController(viewController: MainViewControler(), image: "cart"),
            generatorNavigationController(viewController: BasketViewController(), image: "basket"),
        ]
        
        selectedIndex = 0
    }
    
   
    private func generatorNavigationController(
        viewController: UIViewController,
        image string: String ) -> UINavigationController {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = .white
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
            appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
            
            let navigationController = UINavigationController(rootViewController: viewController)
            navigationController.navigationBar.standardAppearance = appearance
            navigationController.navigationBar.compactAppearance = appearance
            navigationController.navigationBar.scrollEdgeAppearance = appearance
            navigationController.tabBarItem.image = UIImage(systemName: string)
            
            return navigationController
        }
}
