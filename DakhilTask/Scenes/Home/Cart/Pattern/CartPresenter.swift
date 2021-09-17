//
//  CartPresenter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import Foundation

protocol CartView: AnyObject {

}


protocol CartCellView {
    
}

protocol CartPresenter {
    func viewDidLoad()
    func configure(cell: CartCellView, forRow row: Int)
}

class CartPresenterImplementation: CartPresenter {
    fileprivate weak var view: CartView?
    internal let router: CartRouter
    internal let interactor : CartInteractor

    
    init(view: CartView,router: CartRouter,interactor:CartInteractor) {
        self.view = view
        self.router = router
        self.interactor = interactor
       
    }

    
    func viewDidLoad() {
        
    }
    
    func configure(cell: CartCellView, forRow row: Int) {
       
    }

}
