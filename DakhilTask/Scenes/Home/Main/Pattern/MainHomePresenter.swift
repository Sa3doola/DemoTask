//
//  MainHomePresenter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import Foundation

protocol MainHomeView: AnyObject {
    func reloadCollectionData()
    func reloadRandomCategory( model: HomeCategory)
    func reloadImageSlides(slide: [Slide])
}

protocol ProductHomeCellView {
    func cellConfigure(model: ServiceWithOffer)
}

protocol CategoryHomeCellView {
    func cellConfigure(model: HomeCategory)
}

protocol MainHomePresenter {
    func viewDidLoad()
    func numberOfCategories() -> Int
    func numberOfProducts() -> Int
    func configure(cell: ProductHomeCellView, forRow row: Int)
    func configure(cell: CategoryHomeCellView, forRow row: Int)
    func deSelectProduct(at row: Int)
    func deSelectCategory(at row: Int)
}

class MainHomePresenterImplementation: MainHomePresenter {
    
    fileprivate weak var view: MainHomeView?
    internal let router: MainHomeRouter
    internal let interactor : MainHomeInteractor
    
    private var slides: [Slide]?
    private var categories: [HomeCategory]?
    private var randomCategory: HomeCategory?
    private var serviceWithOffer: [ServiceWithOffer]?
    
    
    init(view: MainHomeView,router: MainHomeRouter,interactor:MainHomeInteractor) {
        self.view = view
        self.router = router
        self.interactor = interactor
        
    }
    
    func viewDidLoad() {
        fetchData()
    }
    
    func fetchData() {
        interactor.getHomePage { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                self.categories = model.data?.categories
                self.serviceWithOffer = model.data?.serviceWithOffer
                self.slides = model.data?.slides
                self.randomCategory = model.data?.randomCategory
                DispatchQueue.main.async {
                    self.view?.reloadCollectionData()
                    self.view?.reloadRandomCategory(model: self.randomCategory!)
                    self.view?.reloadImageSlides(slide: self.slides!)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func numberOfCategories() -> Int {
        return categories?.count ?? 0
    }
    
    func configure(cell: CategoryHomeCellView, forRow row: Int) {
        guard let data = categories?[row] else { return }
        cell.cellConfigure(model: data)
    }
    
    func deSelectCategory(at row: Int) {
        guard let data = categories?[row] else { return }
        router.goToCategory(data)
    }
    
    func numberOfProducts() -> Int {
        return serviceWithOffer?.count ?? 0
    }
    
    func configure(cell: ProductHomeCellView, forRow row: Int) {
        guard let data = serviceWithOffer?[row] else { return }
        cell.cellConfigure(model: data)
    }
    
    func deSelectProduct(at row: Int) {
        guard let product = serviceWithOffer?[row] else { return }
        router.goToOffer(product)
    }
}
