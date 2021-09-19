//
//  ViewController.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkIfUserLogin()
    }
    
    func checkIfUserLogin() {
        let token = UserDefaults.standard.loadToken()
        if token != nil {
            makeRootVC(screen: .tabBar)
        } else {
            makeRootVC(screen: .auth)
        }
    }
    
    enum Screen {
        case auth
        case tabBar
    }
    
    func makeRootVC(screen: Screen) {
        
        var viewController: UIViewController?
        switch screen {
        case .auth:
            guard let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LoginNavigationController") as? UINavigationController else { return }
            viewController = loginVC
        case .tabBar:
            guard let baseTabBarVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(identifier: "BaseTabBarController") as? BaseTabBarController else { return }
            viewController = baseTabBarVC
        }
        guard let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate,
              let window = sceneDelegate.window else { return }
        window.rootViewController = viewController
        UIView.transition(with: window, duration: 0.1, options: .transitionCrossDissolve, animations: nil, completion: nil)
        
    }
}

