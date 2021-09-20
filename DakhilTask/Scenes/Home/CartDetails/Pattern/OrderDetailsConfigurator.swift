//
//  OrderDetailsConfigurator.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/18/21.
//

import Foundation


protocol OrderDetailsConfigurator {
    func configure(OrderDetailsViewController:OrderDetailsViewController)
}


class OrderDetailsConfiguratorImplementation {
    
    let model: CartData
    
    init(model: CartData) {
        self.model = model
    }

    func configure(OrderDetailsViewController:OrderDetailsViewController) {
        let view = OrderDetailsViewController
        let router = OrderDetailsRouterImplementation(OrderDetailsViewController: view)
        
        let interactor = OrderDetailsInteractor()
        let presenter = OrderDetailsPresenterImplementation(view: view, router: router,interactor:interactor, model: model)
        
        OrderDetailsViewController.presenter = presenter
    }
    
}
