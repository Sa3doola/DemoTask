//
//  CartConfigurator.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import Foundation


protocol CartConfigurator {
    func configure(CartViewController:CartViewController)
}


class CartConfiguratorImplementation {

    func configure(CartViewController:CartViewController) {
        let view = CartViewController
        let router = CartRouterImplementation(CartViewController: view)
        
        let interactor = CartInteractor()
        let presenter = CartPresenterImplementation(view: view, router: router,interactor:interactor)
        
        
        CartViewController.presenter = presenter
    }
    
}
