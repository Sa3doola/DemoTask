//
//  AboutUsConfigurator.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/21/21.
//

import Foundation


protocol AboutUsConfigurator {
    func configure(AboutUsViewController:AboutUsViewController)
}


class AboutUsConfiguratorImplementation {
    
    func configure(AboutUsViewController:AboutUsViewController) {
        let view = AboutUsViewController
        let router = AboutUsRouterImplementation(AboutUsViewController: view)
        
        let interactor = AboutUsInteractor()
        let presenter = AboutUsPresenterImplementation(view: view, router: router,interactor:interactor)
        
        
        AboutUsViewController.presenter = presenter
    }
    
}
