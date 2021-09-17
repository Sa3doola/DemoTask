//
//  CartDetailsRouter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import UIKit


protocol CartDetailsRouter {
  
}

class CartDetailsRouterImplementation: CartDetailsRouter {
    fileprivate weak var CartDetailsViewController: CartDetailsViewController?
    
    init(CartDetailsViewController: CartDetailsViewController) {
        self.CartDetailsViewController = CartDetailsViewController
    }
    
    
}
