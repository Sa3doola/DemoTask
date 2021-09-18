//
//  MainHomePresenter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import Foundation

protocol MainHomeView: AnyObject {
    
}


protocol ProductHomeCellView {
    
}

protocol CategoryHomeCellView {
    
}

protocol MainHomePresenter {
    func viewDidLoad()
    func configure(cell: ProductHomeCellView, forRow row: Int)
    func configure(cell: CategoryHomeCellView, forRow row: Int)
    func deSelectProduct(at row: Int)
    func deSelectCategory(at row: Int)
}

class MainHomePresenterImplementation: MainHomePresenter {
    
    fileprivate weak var view: MainHomeView?
    internal let router: MainHomeRouter
    internal let interactor : MainHomeInteractor
    
    
    init(view: MainHomeView,router: MainHomeRouter,interactor:MainHomeInteractor) {
        self.view = view
        self.router = router
        self.interactor = interactor
        
    }
    
    
    func viewDidLoad() {
        
    }
    
    func configure(cell: CategoryHomeCellView, forRow row: Int) {
        
    }
    
    func deSelectCategory(at row: Int) {
        router.goToCategory()
    }
    
    func configure(cell: ProductHomeCellView, forRow row: Int) {
        
    }
    
    func deSelectProduct(at row: Int) {
        router.goToOffer()
    }
}
