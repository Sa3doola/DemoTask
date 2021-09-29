//
//  CategoryPresenter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import Foundation

protocol CategoryView: AnyObject {
    func reloadData()
    func hideTableView()
    func showTableView()
}

protocol CategoryPresenter {
    func viewDidLoad()
    var numberOfRows: Int { get }
    func cellConfigure(cell: CategoryCellView, row: Int)
    func backToHome()
    func goToCart()
    func goToFilter()
}

class CategoryPresenterImplementation: CategoryPresenter, FilterCategoryDelegate {
    
    fileprivate weak var view: CategoryView?
    internal let router: CategoryRouter
    internal let interactor : CategoryInteractor
    
    fileprivate var model: Categorry?
    fileprivate var providerModel: [Provider]?
    
    init(view: CategoryView,router: CategoryRouter,interactor:CategoryInteractor, model: Categorry) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.model = model
    }
    
    func viewDidLoad() {
        fetchData()
        checkIfDataInEmpty()
    }
    
    func fetchData() {
        guard let id = model?.id else { return }
        let location = UserDefaults.standard.loadLocation()
        let lat = location.coordinate.latitude
        let lng = location.coordinate.longitude
        let page = 1
        interactor.getProviderCategories(page: page, id: id, lat: lat, lng: lng) { [weak self] (result) in
            switch result {
            case .success(let model):
                self?.providerModel = model.data?.providers
                DispatchQueue.main.async {
                    self?.view?.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func filter(presenter: FilterPresenter, id: Int, rate: String) {
        presenter.router.dismiss()
        guard let id = model?.id else { return }
        let location = UserDefaults.standard.loadLocation()
        let lat = location.coordinate.latitude
        let lng = location.coordinate.longitude
        interactor.filterCatagories(id: id, lat: lat, lng: lng, cityID: id, rate: rate) { [weak self](result) in
            guard let self = self else { return }
            self.providerModel?.removeAll()
            self.view?.reloadData()
            switch result {
            case .success(let model):
                self.providerModel = model.data?.providers
                self.view?.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    var numberOfRows: Int {
        return providerModel?.count ?? 0
    }
    
    func cellConfigure(cell: CategoryCellView, row: Int) {
        guard let data = providerModel?[row] else { return }
        cell.configure(model: data)
    }
    
    func checkIfDataInEmpty() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if self.numberOfRows == 0 {
                self.view?.hideTableView()
            } else {
                self.view?.showTableView()
            }
        }
    }
    
    // MARK: - Router
    
    func backToHome() {
        router.backToHome()
    }
    
    func goToCart() {
        router.goToCart()
    }
    
    func goToFilter() {
        router.goToFilter(delegate: self)
    }
    
}
