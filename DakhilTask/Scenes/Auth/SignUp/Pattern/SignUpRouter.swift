//
//  SignUpRouter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import UIKit


protocol SignUpRouter {
    func backToLogin()
    func goToActivation()
    func goToMap()
}

class SignUpRouterImplementation: SignUpRouter {
    
    
    fileprivate weak var SignUpViewController: SignUpViewController?
    
    init(SignUpViewController: SignUpViewController) {
        self.SignUpViewController = SignUpViewController
    }
    
    let authStoryboard = Storyboard.authStoryboard
    
    func backToLogin() {
        self.SignUpViewController?.navigationController?.popViewController(animated: true)
    }
    
    func goToActivation() {
        let vc: ActivationViewController = authStoryboard.instantiateViewController()
        self.SignUpViewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToMap() {
        let vc: MapViewController = authStoryboard.instantiateViewController()
        self.SignUpViewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
