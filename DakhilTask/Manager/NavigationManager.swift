//
//  NavigationManager.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/21/21.
//

import UIKit

class NavigationManager {
    
    static let shared = NavigationManager()
    
    let auth = Storyboard.authStoryboard
    let tabBar = Storyboard.tabBarStoryboard
    
    enum Screen {
        case auth
        case tabBar
    }
    
    func show(screen: Screen, inController: UIViewController) {
        var viewController: UIViewController?
        
        switch screen {
        case .auth:
            guard let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LoginNavigationController") as? UINavigationController else { return }
            viewController = loginVC
        case .tabBar:
            let baseTabBarVC: BaseTabBarController = tabBar.instantiateViewController()
            viewController = baseTabBarVC
        }
        guard let sceneDelegate = inController.view.window?.windowScene?.delegate as? SceneDelegate,
              let window = sceneDelegate.window else { return }
        window.rootViewController = viewController
        UIView.transition(with: window, duration: 0.1, options: .transitionCrossDissolve, animations: nil, completion: nil)
    }
}


