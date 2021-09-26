//
//  AllCategoriesPresenter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/26/21.
//

import Foundation

protocol AllCategoriesView: AnyObject {
    func reloadData()
}

protocol AllCategoriesPresenter {
    func viewDidLoad()
    var numberOfRow: Int { get }
    func configure(cell: AllCategoriesCellView, forRow row: Int)
    func didSelect(row: Int)
    
    func back()
}

class AllCategoriesPresenterImplementation: AllCategoriesPresenter {
    
    fileprivate weak var view: AllCategoriesView?
    internal let router: AllCategoriesRouter
    internal let interactor : AllCategoriesInteractor

    
    init(view: AllCategoriesView,router: AllCategoriesRouter,interactor:AllCategoriesInteractor) {
        self.view = view
        self.router = router
        self.interactor = interactor
       
    }

    
    func viewDidLoad() {
        
    }
    
    var numberOfRow: Int {
        return 5
    }
    
    func configure(cell: AllCategoriesCellView, forRow row: Int) {
       
    }

    func didSelect(row: Int) {
        router.goToCategory()
    }
    
    func back() {
        router.back()
    }
}
