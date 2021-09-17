//
//  CartDetailsConfigurator.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import Foundation


protocol CartDetailsConfigurator {
    func configure(CartDetailsViewController:CartDetailsViewController)
}


class CartDetailsConfiguratorImplementation {

    func configure(CartDetailsViewController:CartDetailsViewController) {
        let view = CartDetailsViewController
        let router = CartDetailsRouterImplementation(CartDetailsViewController: view)
        
        let interactor = CartDetailsInteractor()
        let presenter = CartDetailsPresenterImplementation(view: view, router: router,interactor:interactor)
        
        
        CartDetailsViewController.presenter = presenter
    }
    
}
