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
}

class CategoryPresenterImplementation: CategoryPresenter {
    
    fileprivate weak var view: CategoryView?
    internal let router: CategoryRouter
    internal let interactor : CategoryInteractor

    fileprivate var model: HomeCategory?
    fileprivate var providerModel: [Provider]?
    
    init(view: CategoryView,router: CategoryRouter,interactor:CategoryInteractor, model: HomeCategory) {
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
   //     guard let id = model?.id else { return }
        let location = UserDefaults.standard.loadLocation()
        let lat = location.coordinate.latitude
        let lng = location.coordinate.longitude
        let page = 1
        interactor.getProviderCategories(page: page, id: 71, lat: lat, lng: lng) { [weak self] (result) in
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
    
    var numberOfRows: Int {
        return providerModel?.count ?? 0
    }
    
    func cellConfigure(cell: CategoryCellView, row: Int) {
        guard let data = providerModel?[row] else { return }
        cell.configure(model: data)
    }
    
    func backToHome() {
        router.backToHome()
    }
    
    func goToCart() {
        router.goToCart()
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

}
