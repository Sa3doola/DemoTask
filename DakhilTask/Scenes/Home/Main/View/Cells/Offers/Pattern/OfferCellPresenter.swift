//
//  OfferCellPresenter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/23/21.
//

import Foundation

protocol OfferTableCellView: AnyObject {
    func setDelegate(delegate: OfferCellDelegate)
    func reloadData()
}

protocol OfferCollectionCellView {
    func cellConfigure(model: ProductModel)
}

protocol OfferCellPresenter {
    func viewDidLoad()
    func numberOfRows() -> Int
    func configure(cell: OfferCollectionCellView, at row: Int)
    func didSelect(row: Int)
}

class OfferCellPresenterImplementaion: OfferCellPresenter, OfferCellDelegate {
    
    fileprivate weak var view: OfferTableCellView?
    internal let router: OfferCellRouter
    
    private var models: [ProductModel]?
    
    
    init(view: OfferTableCellView, router: OfferCellRouter) {
        self.view = view
        self.router = router
    }
    
    func viewDidLoad() {
        self.view?.setDelegate(delegate: self)
    }
    
    func setModels(models: [ProductModel]) {
        self.models = models
        self.view?.reloadData()
    }
    
    func numberOfRows() -> Int {
        return models?.count ?? 0
    }
    
    func configure(cell: OfferCollectionCellView, at row: Int) {
        guard let model = models?[row] else { return }
        cell.cellConfigure(model: model)
    }
    
    func didSelect(row: Int) {
        guard let model = models?[row] else { return }
        router.goToOffer(model)
    }
}
