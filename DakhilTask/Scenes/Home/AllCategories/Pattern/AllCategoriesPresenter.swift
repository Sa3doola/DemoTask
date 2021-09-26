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
    
    private var models: [HomeCategory]? = []
    
    init(view: AllCategoriesView,router: AllCategoriesRouter,interactor:AllCategoriesInteractor) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    // MARK: - FetchDataWithPagination
    
    func viewDidLoad() {
        fethcData()
    }
    
    func fethcData() {
        interactor.getAllCategories { (result) in
            switch result {
            case .success(let model):
                print(model)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - TableViewConfigure
    
    var numberOfRow: Int {
        return models?.count ?? 0
    }
    
    func configure(cell: AllCategoriesCellView, forRow row: Int) {
        guard let data = models?[row] else { return }
        cell.configure(model: data)
    }
    
    // MARK: - Router
    
    func didSelect(row: Int) {
        guard let data = models?[row] else { return }
        router.goToCategory(model: data)
    }
    
    func back() {
        router.back()
    }
}
