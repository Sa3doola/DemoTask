//
//  CategoryCellConfigurator.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/23/21.
//

import Foundation

protocol CategoryCellConfigurator {
    func configure(CategoryTableCell: CatgTableCell)
}

class CategoryCellConfiguratorImplementation {
    
    func configure(CategoryTableCell: CatgTableCell) {
        let view = CategoryTableCell
        let router = CategoryCellRouterImplementation(CategoryTableCell: view)
        let presenter = CategoryCellImplementation(view: view, router: router)
        
        CategoryTableCell.presenter = presenter
        
    }
}
