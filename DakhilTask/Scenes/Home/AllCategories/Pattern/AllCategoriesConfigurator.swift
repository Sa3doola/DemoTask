//
//  AllCategoriesConfigurator.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/26/21.
//

import Foundation


protocol AllCategoriesConfigurator {
    func configure(AllCategoriesViewController:AllCategoriesViewController)
}


class AllCategoriesConfiguratorImplementation {

    func configure(AllCategoriesViewController:AllCategoriesViewController) {
        let view = AllCategoriesViewController
        let router = AllCategoriesRouterImplementation(AllCategoriesViewController: view)
        
        let interactor = AllCategoriesInteractor()
        let presenter = AllCategoriesPresenterImplementation(view: view, router: router,interactor:interactor)
        
        
        AllCategoriesViewController.presenter = presenter
    }
    
}
