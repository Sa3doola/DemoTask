//
//  ProfileConfigurator.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/29/21.
//

import Foundation


protocol ProfileConfigurator {
    func configure(ProfileViewController:ProfileViewController)
}


class ProfileConfiguratorImplementation {

    func configure(ProfileViewController:ProfileViewController) {
        let view = ProfileViewController
        let router = ProfileRouterImplementation(ProfileViewController: view)
        
        let interactor = ProfileInteractor()
        let presenter = ProfilePresenterImplementation(view: view, router: router,interactor:interactor)
        
        
        ProfileViewController.presenter = presenter
    }
    
}
