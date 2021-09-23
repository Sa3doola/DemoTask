//
//  CategoryCellPresenter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/23/21.
//

import Foundation

protocol CatCellView: AnyObject {
    func setDelegate(delegate: CellDelegate)
    func reloadData()
}

protocol CategoryCollectionCellView {
    func cellConfigure(_ model: HomeCategory)
}

protocol CategoryCellPresenter {
    func viewDidLoad()
    func numberOfRows() -> Int
    func configure(cell: CategoryCollectionCellView, at row: Int)
}

class CategoryCellImplementation: CategoryCellPresenter, CellDelegate {
    
    fileprivate weak var view: CatCellView?
    internal let router: CategoryCellRouter
    
    var models: [HomeCategory]?
    
    init(view: CatCellView, router: CategoryCellRouter) {
        self.view = view
        self.router = router
    }
    
    func setModels(models: [HomeCategory]) {
        self.models = models
        self.view?.reloadData()
    }
    
    func viewDidLoad() {
        self.view?.setDelegate(delegate: self)
    }
    
    func numberOfRows() -> Int {
        return models?.count ?? 0
    }
    
    func configure(cell: CategoryCollectionCellView, at row: Int) {
        guard let data = models?[row] else { return }
        cell.cellConfigure(data)
    }
    
}
