//
//  ProductConfigurator.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/18/21.
//

import Foundation


protocol ProductConfigurator {
    func configure(ProductViewController:ProductViewController)
}


class ProductConfiguratorImplementation {

    func configure(ProductViewController:ProductViewController) {
        let view = ProductViewController
        let router = ProductRouterImplementation(ProductViewController: view)
        
        let interactor = ProductInteractor()
        let presenter = ProductPresenterImplementation(view: view, router: router,interactor:interactor)
        
        
        ProductViewController.presenter = presenter
    }
    
}
