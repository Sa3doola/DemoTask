//
//  CategoryRouter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import UIKit


protocol CategoryRouter {
  
}

class CategoryRouterImplementation: CategoryRouter {
    fileprivate weak var CategoryViewController: CategoryViewController?
    
    init(CategoryViewController: CategoryViewController) {
        self.CategoryViewController = CategoryViewController
    }
    
    
}
