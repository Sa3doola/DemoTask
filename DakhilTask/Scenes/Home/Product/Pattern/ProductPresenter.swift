//
//  ProductPresenter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/18/21.
//

import Foundation

protocol ProductView: AnyObject {
    func configureView(model: ServiceWithOffer)
}

protocol ProductPresenter {
    func viewDidLoad()
    func backToHome()
}

class ProductPresenterImplementation: ProductPresenter {
    
    
    fileprivate weak var view: ProductView?
    internal let router: ProductRouter
    internal let interactor : ProductInteractor

    fileprivate var model: ServiceWithOffer?
    
    init(view: ProductView,router: ProductRouter,interactor:ProductInteractor, model: ServiceWithOffer) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.model = model
    }
    
    func viewDidLoad() {
        view?.configureView(model: self.model!)
    }
    
    func backToHome() {
        router.backToHome()
    }
}
