//
//  ProductRouter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/18/21.
//

import UIKit


protocol ProductRouter {
  
}

class ProductRouterImplementation: ProductRouter {
    fileprivate weak var ProductViewController: ProductViewController?
    
    init(ProductViewController: ProductViewController) {
        self.ProductViewController = ProductViewController
    }
    
    
}
