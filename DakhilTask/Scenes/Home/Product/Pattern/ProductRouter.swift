//
//  ProductRouter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/18/21.
//

import UIKit


protocol ProductRouter {
    func backToHome()
    func goToCart()
}

class ProductRouterImplementation: ProductRouter {
    
    fileprivate weak var ProductViewController: ProductViewController?
    
    init(ProductViewController: ProductViewController) {
        self.ProductViewController = ProductViewController
    }
    
    let homeStoryboard = Storyboard.homeSrotyboard
    
    func backToHome() {
        self.ProductViewController?.navigationController?.popViewController(animated: true)
    }
    
    func goToCart() {
        let vc: CartViewController = homeStoryboard.instantiateViewController()
        self.ProductViewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
