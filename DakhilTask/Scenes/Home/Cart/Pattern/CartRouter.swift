//
//  CartRouter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import UIKit


protocol CartRouter {
    func goToOrderDetails(model: CartData)
}

class CartRouterImplementation: CartRouter {
    
    fileprivate weak var CartViewController: CartViewController?
    
    init(CartViewController: CartViewController) {
        self.CartViewController = CartViewController
    }
    
    let homeStoryboard = Storyboard.homeSrotyboard
    
    func goToOrderDetails(model: CartData) {
        let vc: OrderDetailsViewController = homeStoryboard.instantiateViewController()
        vc.configurator = OrderDetailsConfiguratorImplementation(model: model)
        self.CartViewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
}
