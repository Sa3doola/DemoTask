//
//  CategoryCellRouter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/23/21.
//

import Foundation

protocol CategoryCellRouter {
    
}

class CategoryCellRouterImplementation: CategoryCellRouter {
    
    fileprivate weak var CategoryTableCell: CatgTableCell?
    
    init(CategoryTableCell: CatgTableCell) {
        self.CategoryTableCell = CategoryTableCell
    }
}
