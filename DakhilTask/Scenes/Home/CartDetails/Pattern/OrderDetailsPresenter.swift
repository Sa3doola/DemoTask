//
//  OrderDetailsPresenter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/18/21.
//

import Foundation

protocol OrderDetailsView: AnyObject {

}


protocol OrderDetailsCellView {
    
}

protocol OrderDetailsPresenter {
    func viewDidLoad()
    func configure(cell: OrderDetailsCellView, forRow row: Int)
}

class OrderDetailsPresenterImplementation: OrderDetailsPresenter {
    fileprivate weak var view: OrderDetailsView?
    internal let router: OrderDetailsRouter
    internal let interactor : OrderDetailsInteractor

    
    init(view: OrderDetailsView,router: OrderDetailsRouter,interactor:OrderDetailsInteractor) {
        self.view = view
        self.router = router
        self.interactor = interactor
       
    }

    
    func viewDidLoad() {
        
    }
    
    func configure(cell: OrderDetailsCellView, forRow row: Int) {
       
    }

}
