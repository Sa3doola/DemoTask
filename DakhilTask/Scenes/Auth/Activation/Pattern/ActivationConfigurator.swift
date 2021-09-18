//
//  ActivationConfigurator.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import Foundation


protocol ActivationConfigurator {
    func configure(ActivationViewController:ActivationViewController)
}


class ActivationConfiguratorImplementation {
    
    let phone: String
    
    init(phone: String) {
        self.phone = phone
    }
    
    func configure(ActivationViewController:ActivationViewController) {
        let view = ActivationViewController
        let router = ActivationRouterImplementation(ActivationViewController: view)
        
        let interactor = ActivationInteractor()
        let presenter = ActivationPresenterImplementation(view: view, router: router,interactor:interactor, phone: phone)
        
        ActivationViewController.presenter = presenter
    }
}
