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
    func configure(model: ProductModel)
}

protocol CategoryPresenter {
    func viewDidLoad()
    func backToHome()
    func configure(cell: CategoryCellView, forRow row: Int)
    func goToCart()
}

class CategoryPresenterImplementation: CategoryPresenter {
    fileprivate weak var view: CategoryView?
    internal let router: CategoryRouter
    internal let interactor : CategoryInteractor

    fileprivate var model: ProductModel?
    
    init(view: CategoryView,router: CategoryRouter,interactor:CategoryInteractor, model: ProductModel) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.model = model
    }

    
    func viewDidLoad() {
        
    }
    
    func backToHome() {
        router.backToHome()
    }
    
    func goToCart() {
        router.goToCart()
    }
    
    func configure(cell: CategoryCellView, forRow row: Int) {
        cell.configure(model: model!)
    }

}
