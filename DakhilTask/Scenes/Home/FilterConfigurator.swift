//
//  FilterConfigurator.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/28/21.
//

import Foundation


protocol FilterConfigurator {
    func configure(FilterViewController:FilterViewController)
}


class FilterConfiguratorImplementation {
    
    var filterCategoryDelegate: FilterCategoryDelegate?
    
    init(FilterCategoryDelegate: FilterCategoryDelegate?) {
        self.filterCategoryDelegate = FilterCategoryDelegate
    }

    func configure(FilterViewController:FilterViewController) {
        let view = FilterViewController
        let router = FilterRouterImplementation(FilterViewController: view)
        
        let interactor = FilterInteractor()
        let presenter = FilterPresenterImplementation(view: view, router: router,interactor:interactor, delegate: filterCategoryDelegate)
        
        
        FilterViewController.presenter = presenter
    }
    
}
