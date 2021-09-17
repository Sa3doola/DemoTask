//
//  SignUpConfigurator.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import Foundation


protocol SignUpConfigurator {
    func configure(SignUpViewController:SignUpViewController)
}

class SignUpConfiguratorImplementation {
    
    func configure(SignUpViewController:SignUpViewController) {
        let view = SignUpViewController
        let router = SignUpRouterImplementation(SignUpViewController: view)
        
        let interactor = SignUpInteractor()
        let presenter = SignUpPresenterImplementation(view: view, router: router,interactor:interactor)
        
        
        SignUpViewController.presenter = presenter
    }
}
