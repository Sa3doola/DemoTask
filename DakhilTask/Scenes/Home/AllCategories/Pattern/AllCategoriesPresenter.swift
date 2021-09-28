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
    
    func fetchMoreData(page: Int)
    var totalPage: Int { get }
    // TableView
    var numberOfRow: Int { get }
    func configure(cell: AllCategoriesCellView, forRow row: Int)
    
    // Router
    func didSelect(row: Int)
    func back()
}

class AllCategoriesPresenterImplementation: AllCategoriesPresenter {
    
    fileprivate weak var view: AllCategoriesView?
    internal let router: AllCategoriesRouter
    internal let interactor : AllCategoriesInteractor
    
    private var models: [Categorry]? = []
    
    private var total: Int?
    
    init(view: AllCategoriesView,router: AllCategoriesRouter,interactor:AllCategoriesInteractor) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    // MARK: - FetchDataWithPagination
    
    func viewDidLoad() {
        fetchMoreData(page: 1)
    }
    
    var totalPage: Int {
        return total ?? 1
    }
    
    func fetchMoreData(page: Int) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            self.interactor.getAllCategories(name: "", page: page) { [weak self] (result) in
                guard let self = self else { return }
                switch result {
                case .success(let model):
                    guard let moreData = model.data?.categories else { return }
                    self.total = model.data?.paginate?.totalPages
                    self.models?.append(contentsOf: moreData)
                    DispatchQueue.main.async {
                        self.view?.reloadData()
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
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
