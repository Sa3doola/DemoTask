//
//  ProductRouter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/18/21.
//

import UIKit


protocol ProductRouter {
  func backToHome()
}

class ProductRouterImplementation: ProductRouter {
    fileprivate weak var ProductViewController: ProductViewController?
    
    init(ProductViewController: ProductViewController) {
        self.ProductViewController = ProductViewController
    }
    
    func backToHome() {
        self.ProductViewController?.navigationController?.popViewController(animated: true)
    }
}
