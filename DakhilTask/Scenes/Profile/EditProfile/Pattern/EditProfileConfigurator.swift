//
//  EditProfileConfigurator.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/30/21.
//

import Foundation


protocol EditProfileConfigurator {
    func configure(EditProfileViewController:EditProfileViewController)
}


class EditProfileConfiguratorImplementation {

    func configure(EditProfileViewController:EditProfileViewController) {
        let view = EditProfileViewController
        let router = EditProfileRouterImplementation(EditProfileViewController: view)
        
        let interactor = EditProfileInteractor()
        let presenter = EditProfilePresenterImplementation(view: view, router: router,interactor:interactor)
        
        
        EditProfileViewController.presenter = presenter
    }
    
}
