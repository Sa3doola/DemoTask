//
//  CartRouter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import UIKit


protocol CartRouter {
  
}

class CartRouterImplementation: CartRouter {
    fileprivate weak var CartViewController: CartViewController?
    
    init(CartViewController: CartViewController) {
        self.CartViewController = CartViewController
    }
    
    
}
