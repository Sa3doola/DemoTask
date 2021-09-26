//
//  AllCategoriesRouter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/26/21.
//

import UIKit


protocol AllCategoriesRouter {
    func goToCategory(model: HomeCategory)
    func back()
}

class AllCategoriesRouterImplementation: AllCategoriesRouter {
    
    fileprivate weak var AllCategoriesViewController: AllCategoriesViewController?
    
    let home = Storyboard.homeSrotyboard
    
    init(AllCategoriesViewController: AllCategoriesViewController) {
        self.AllCategoriesViewController = AllCategoriesViewController
    }
    
    func goToCategory(model: HomeCategory) {
        let vc: CategoryViewController = home.instantiateViewController()
        vc.configurator = CategoryConfiguratorImplementation(model: model)
        self.AllCategoriesViewController?.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func back() {
        self.AllCategoriesViewController?.navigationController?.popViewController(animated: true)
    }
}
