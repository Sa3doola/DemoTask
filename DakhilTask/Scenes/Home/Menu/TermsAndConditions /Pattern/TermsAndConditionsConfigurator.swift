//
//  TermsAndConditionsConfigurator.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/21/21.
//

import Foundation


protocol TermsAndConditionsConfigurator {
    func configure(TermsAndConditionsViewController:TermsAndConditionsViewController)
}


class TermsAndConditionsConfiguratorImplementation {
    
    func configure(TermsAndConditionsViewController:TermsAndConditionsViewController) {
        let view = TermsAndConditionsViewController
        let router = TermsAndConditionsRouterImplementation(TermsAndConditionsViewController: view)
        
        let interactor = TermsAndConditionsInteractor()
        let presenter = TermsAndConditionsPresenterImplementation(view: view, router: router,interactor:interactor)
        
        
        TermsAndConditionsViewController.presenter = presenter
    }
    
}
