//
//  CategoryRouter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import UIKit


protocol CategoryRouter {
    func backToHome()
    func goToCart()
    func goToFilter(delegate: FilterCategoryDelegate)
}

class CategoryRouterImplementation: CategoryRouter {
    fileprivate weak var CategoryViewController: CategoryViewController?
    
    init(CategoryViewController: CategoryViewController) {
        self.CategoryViewController = CategoryViewController
    }
    
    let homeStoryboard = Storyboard.homeSrotyboard
    
    func goToCart() {
        let vc: CartViewController = homeStoryboard.instantiateViewController()
        self.CategoryViewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToFilter(delegate: FilterCategoryDelegate) {
        let vc: FilterViewController = homeStoryboard.instantiateViewController()
        vc.configurator = FilterConfiguratorImplementation(FilterCategoryDelegate: delegate)
        self.CategoryViewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func backToHome() {
        self.CategoryViewController?.navigationController?.popViewController(animated: true)
    }
}
