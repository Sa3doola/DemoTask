//
//  LoginRouter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import UIKit


protocol LoginRouter {
    func goToSignUp()
    func goToHome()
}

class LoginRouterImplementation: LoginRouter {
    
    fileprivate weak var LoginViewController: LoginViewController?
    
    init(LoginViewController: LoginViewController) {
        self.LoginViewController = LoginViewController
    }
    
    let authStoryboard = Storyboard.authStoryboard
    let homeStoryboard = Storyboard.tabBarStoryboard
    
    func goToSignUp() {
        let vc: SignUpViewController = authStoryboard.instantiateViewController()
        self.LoginViewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToHome() {
        let vc: BaseTabBarController = homeStoryboard.instantiateViewController()
        self.LoginViewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
