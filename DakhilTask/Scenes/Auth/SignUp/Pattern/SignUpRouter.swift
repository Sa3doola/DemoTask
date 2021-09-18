//
//  SignUpRouter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import UIKit


protocol SignUpRouter {
    func backToLogin()
    func goToActivation(phone: String)
    func goToMap()
}

class SignUpRouterImplementation: SignUpRouter {
    
    fileprivate weak var SignUpViewController: SignUpViewController?
    var phone: String!
    
    init(SignUpViewController: SignUpViewController) {
        self.SignUpViewController = SignUpViewController
    }
    
    let authStoryboard = Storyboard.authStoryboard
    
    func backToLogin() {
        self.SignUpViewController?.navigationController?.popViewController(animated: true)
    }
    
    func goToActivation(phone: String) {
        self.phone = phone
        let vc: ActivationViewController = authStoryboard.instantiateViewController()
        vc.configurator = ActivationConfiguratorImplementation(phone: phone)
        self.SignUpViewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToMap() {
        let vc: MapViewController = authStoryboard.instantiateViewController()
        vc.delegate = self.SignUpViewController
        self.SignUpViewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
