//
//  CartPresenter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import Foundation

protocol CartView: AnyObject {
    func reloadData()
}


protocol CartCellView {
    func configure(model: CartData)
}

protocol CartPresenter {
    func viewDidLoad()
    func numberOfData() -> Int
    func configure(cell: CartCellView, forRow row: Int)
    func deSelect(at row: Int)
}

class CartPresenterImplementation: CartPresenter {
    
    fileprivate weak var view: CartView?
    internal let router: CartRouter
    internal let interactor : CartInteractor
    
    private var models: [CartData]?
    
    init(view: CartView,router: CartRouter,interactor:CartInteractor) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        getCartDetails()
    }
    
    func getCartDetails() {
        guard let uuid = UserDefaults.standard.loadUUID() else { return }
        print("UUID: \(uuid)")
        interactor.cartDetails(uuid: uuid) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                print(model)
                self.models = model.data
                DispatchQueue.main.async {
                    self.view?.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func numberOfData() -> Int {
        return models?.count ?? 0
    }
    
    func configure(cell: CartCellView, forRow row: Int) {
        guard let data = models?[row] else { return }
        cell.configure(model: data)
    }
    
    func deSelect(at row: Int) {
        guard let data = models?[row] else { return }
        router.goToOrderDetails(model: data)
    }
    
}
