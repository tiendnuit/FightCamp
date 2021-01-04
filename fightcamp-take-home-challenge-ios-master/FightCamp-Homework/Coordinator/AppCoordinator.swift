//
//  AppCoordinator.swift
//  FightCamp-Homework
//
//  Created by Scor Doan on 04/01/2021.
//  Copyright © 2021 Alexandre Marcotte. All rights reserved.
//

import Foundation
import UIKit
import Combine

class AppCoordinator: Coordinator {
    private var window: UIWindow?
    
    var navigationController = UINavigationController()
    
    init(_ window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        navigationController.navigationBar.isHidden = true
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        showHomePage()
    }
    
    func showHomePage() {
        let homePage = HomeViewController()
        homePage.viewModel = HomeViewModel()
        navigationController.viewControllers = [homePage]
    }
}
