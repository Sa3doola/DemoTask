//
//  ProductPresenter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/18/21.
//

import Foundation

protocol ProductView: AnyObject {

}


protocol ProductCellView {
    
}

protocol ProductPresenter {
    func viewDidLoad()
    func configure(cell: ProductCellView, forRow row: Int)
}

class ProductPresenterImplementation: ProductPresenter {
    fileprivate weak var view: ProductView?
    internal let router: ProductRouter
    internal let interactor : ProductInteractor

    
    init(view: ProductView,router: ProductRouter,interactor:ProductInteractor) {
        self.view = view
        self.router = router
        self.interactor = interactor
       
    }

    
    func viewDidLoad() {
        
    }
    
    func configure(cell: ProductCellView, forRow row: Int) {
       
    }

}
