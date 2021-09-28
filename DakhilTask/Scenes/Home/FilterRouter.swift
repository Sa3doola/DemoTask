//
//  FilterRouter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/28/21.
//

import UIKit


protocol FilterRouter {
    func dismiss()
}

class FilterRouterImplementation: FilterRouter {
    
    fileprivate weak var FilterViewController: FilterViewController?
    
    init(FilterViewController: FilterViewController) {
        self.FilterViewController = FilterViewController
    }
    func dismiss() {
        self.FilterViewController?.navigationController?.popViewController(animated: true)
    }
}
