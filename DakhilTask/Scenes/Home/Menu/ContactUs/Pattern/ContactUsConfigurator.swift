//
//  ContactUsConfigurator.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/21/21.
//

import Foundation


protocol ContactUsConfigurator {
    func configure(ContactUsViewController:ContactUsViewController)
}


class ContactUsConfiguratorImplementation {

    func configure(ContactUsViewController:ContactUsViewController) {
        let view = ContactUsViewController
        let router = ContactUsRouterImplementation(ContactUsViewController: view)
        
        let interactor = ContactUsInteractor()
        let presenter = ContactUsPresenterImplementation(view: view, router: router,interactor:interactor)
        
        
        ContactUsViewController.presenter = presenter
    }
    
}
