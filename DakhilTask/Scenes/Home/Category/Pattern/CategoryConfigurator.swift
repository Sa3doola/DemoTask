//
//  CategoryConfigurator.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import Foundation


protocol CategoryConfigurator {
    func configure(CategoryViewController:CategoryViewController)
}


class CategoryConfiguratorImplementation {
    
    let model: HomeCategory
    
    init(model: HomeCategory) {
        self.model = model
    }

    func configure(CategoryViewController:CategoryViewController) {
        let view = CategoryViewController
        let router = CategoryRouterImplementation(CategoryViewController: view)
        
        let interactor = CategoryInteractor()
        let presenter = CategoryPresenterImplementation(view: view, router: router,interactor:interactor, model: model)
        
        
        CategoryViewController.presenter = presenter
    }
    
}
