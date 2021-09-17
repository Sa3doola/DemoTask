//
//  CartDetailsPresenter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import Foundation

protocol CartDetailsView: AnyObject {

}


protocol CartDetailsCellView {
    
}

protocol CartDetailsPresenter {
    func viewDidLoad()
    func configure(cell: CartDetailsCellView, forRow row: Int)
}

class CartDetailsPresenterImplementation: CartDetailsPresenter {
    fileprivate weak var view: CartDetailsView?
    internal let router: CartDetailsRouter
    internal let interactor : CartDetailsInteractor

    
    init(view: CartDetailsView,router: CartDetailsRouter,interactor:CartDetailsInteractor) {
        self.view = view
        self.router = router
        self.interactor = interactor
       
    }

    
    func viewDidLoad() {
        
    }
    
    func configure(cell: CartDetailsCellView, forRow row: Int) {
       
    }

}
