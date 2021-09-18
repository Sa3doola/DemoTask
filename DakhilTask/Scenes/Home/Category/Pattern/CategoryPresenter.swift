//
//  CategoryPresenter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import Foundation

protocol CategoryView: AnyObject {

}


protocol CategoryCellView {
    
}

protocol CategoryPresenter {
    func viewDidLoad()
    func configure(cell: CategoryCellView, forRow row: Int)
}

class CategoryPresenterImplementation: CategoryPresenter {
    fileprivate weak var view: CategoryView?
    internal let router: CategoryRouter
    internal let interactor : CategoryInteractor

    fileprivate var model: HomeCategory?
    
    init(view: CategoryView,router: CategoryRouter,interactor:CategoryInteractor, model: HomeCategory) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.model = model
    }

    
    func viewDidLoad() {
        
    }
    
    func configure(cell: CategoryCellView, forRow row: Int) {
       
    }

}
