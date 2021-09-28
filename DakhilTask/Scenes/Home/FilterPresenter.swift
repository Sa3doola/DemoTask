//
//  FilterPresenter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/28/21.
//

import Foundation

protocol FilterView: AnyObject {
    func reloadData()
}

protocol FilterPresenter {
    var router: FilterRouter { get }
    func viewDidLoad()
    var numberOfRows: Int { get }
    func configure(cell: FilterCellView, forRow row: Int)
    func didSelect(row: Int)
    func addFilter()
    func getRate(rate: String)
}

protocol FilterCategoryDelegate: class {
    func filter(presenter: FilterPresenter, id: Int, rate: String)
}

class FilterPresenterImplementation: FilterPresenter {
    
    fileprivate weak var view: FilterView?
    fileprivate weak var delegate: FilterCategoryDelegate?
    private(set) var router: FilterRouter
    internal let interactor : FilterInteractor

    private var models: [CitiesModel]?
    
    private var id: Int?
    
    private var rate: String?
    
    init(view: FilterView,router: FilterRouter,interactor:FilterInteractor, delegate: FilterCategoryDelegate?) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.delegate = delegate
    }

    
    func viewDidLoad() {
        fetchData()
    }
    
    func fetchData() {
        interactor.getCities { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                self.models = model.data
                DispatchQueue.main.async {
                    self.view?.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    var numberOfRows: Int {
        return models?.count ?? 0
    }
    
    func configure(cell: FilterCellView, forRow row: Int) {
        guard let model = models?[row] else { return }
        cell.configure(model: model)
    }
    
    func didSelect(row: Int) {
        guard let model = models?[row] else { return }
        self.id = model.id
    }
    
    func addFilter() {
        guard let id = self.id else { return }
        guard let StrongRate = rate else { return }
        self.delegate?.filter(presenter: self, id: id, rate: StrongRate)
        
    }
    
    func getRate(rate: String) {
        self.rate = rate
    }
}
