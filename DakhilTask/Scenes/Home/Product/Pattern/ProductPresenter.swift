//
//  ProductPresenter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/18/21.
//

import Foundation

protocol ProductView: AnyObject {
    func configureView(model: ProductModel)
    func showActionSheet()
}

protocol ProductPresenter {
    func viewDidLoad()
    func backToHome()
    func addToCart(amount: Int, lat: Double, lng: Double)
    func goToCart()
}

class ProductPresenterImplementation: ProductPresenter {
    
    
    fileprivate weak var view: ProductView?
    internal let router: ProductRouter
    internal let interactor : ProductInteractor

    fileprivate var model: ProductModel?
    
    init(view: ProductView,router: ProductRouter,interactor:ProductInteractor, model: ProductModel) {
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
    
    func addToCart(amount: Int, lat: Double, lng: Double) {
        guard let uuid = UserDefaults.standard.loadUUID() else { return  }
        guard let address = UserDefaults.standard.loadAddress() else { return }
        guard let providerId = model?.providerID else { return }
        guard let serviceId = model?.id else { return }
        
        interactor.addToCart(uuid: uuid, lat: lat, lng: lng, address: address, providerId: providerId,
                             serviceId: serviceId, amount: amount) { (result) in
            switch result {
            case .success(let model):
                print(model)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
    func goToCart() {
        router.goToCart()
    }
}
