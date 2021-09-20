//
//  OrderDetailsPresenter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/18/21.
//

import Foundation

protocol OrderDetailsView: AnyObject {
    func reloadData(price: Double)
}

protocol OrderDetailsCellView {
    func configreCell(_ model: Service)
}

protocol OrderDetailsPresenter {
    func viewDidLoad()
    func numberOfRows() -> Int
    func configure(cell: OrderDetailsCellView, forRow row: Int)
    
}

class OrderDetailsPresenterImplementation: OrderDetailsPresenter, DidUpdateOrderAmount {
    
    fileprivate weak var view: OrderDetailsView?
    internal let router: OrderDetailsRouter
    internal let interactor : OrderDetailsInteractor
    
    fileprivate var model: CartData?
    
    private var models: [Service]?
    
    init(view: OrderDetailsView,router: OrderDetailsRouter,interactor:OrderDetailsInteractor, model: CartData) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.model = model
    }
    
    func viewDidLoad() {
        fetchOrderData()
    }
    
    func numberOfRows() -> Int {
        return self.models?.count ?? 0
    }
    
    func configure(cell: OrderDetailsCellView, forRow row: Int) {
        guard let data = models?[row] else { return }
        cell.configreCell(data)
    }
    
    func updateOrderAmountCell(amount: Int, orderId: Int) {
        print("Delegate Is Done")
        updateOrderAmount(orderServiceId: orderId, amount: amount)
    }
    
    func updateOrderAmount(orderServiceId: Int, amount: Int) {
        interactor.updateOrderAmount(orderServiceId: orderServiceId, amount: amount) { (result) in
            switch result {
            case .success(let model):
                print(model)
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchOrderData() {
        guard let orderId = model?.id else { return }
        interactor.getOrderDetails(orderId: orderId) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                print(model.data?.services ?? "")
                self.models = model.data?.services
                self.view?.reloadData(price: model.data?.price ?? 0)
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

