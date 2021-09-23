//
//  MainHomePresenter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import Foundation

protocol MainHomeView: AnyObject {
    func reloadData()
}

protocol SlideImageCellView {
    func cellConfigure(model: [Slide])
}

protocol CategoryHomeCellView {
    func cellConfigure(model: [HomeCategory])
}

protocol RandomCategoryCellView {
    func cellConfigure(model: HomeCategory)
}

protocol ProductHomeCellView {
    func cellConfigure(model: [ProductModel])
}

protocol MainHomePresenter {
    func viewDidLoad()
    func configure(cell: SlideImageCellView)
    func configure(cell: CategoryHomeCellView)
    func configure(cell: RandomCategoryCellView)
    func configure(cell: ProductHomeCellView)
    func goToMenu()
    func goToCart()
}

class MainHomePresenterImplementation: MainHomePresenter {
    
    // MARK: - Properties
    
    fileprivate weak var view: MainHomeView?
    internal let router: MainHomeRouter
    internal let interactor : MainHomeInteractor
    
    private var slides: [Slide]?
    private var categories: [HomeCategory]?
    private var randomCategory: HomeCategory?
    private var serviceWithOffer: [ProductModel]?
    
    // MARK: - Init
    
    init(view: MainHomeView,router: MainHomeRouter,interactor:MainHomeInteractor) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    // MARK: - viewDidLoad
    
    func viewDidLoad() {
        fetchData()
    }
    
    func fetchData() {
        interactor.getHomePage { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                self.slides = model.data?.slides
                self.categories = model.data?.categories
                self.randomCategory = model.data?.randomCategory
                self.serviceWithOffer = model.data?.serviceWithOffer
                DispatchQueue.main.async {
                    self.view?.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - TableCellConfigure
    
    func configure(cell: SlideImageCellView) {
        guard let models = self.slides else { return }
        cell.cellConfigure(model: models)
    }
    
    func configure(cell: CategoryHomeCellView) {
        guard let models = self.categories else { return }
        cell.cellConfigure(model: models)
    }
    
    func configure(cell: RandomCategoryCellView) {
        guard let model = self.randomCategory else { return }
        cell.cellConfigure(model: model)
    }
    
    func configure(cell: ProductHomeCellView) {
        guard let models = self.serviceWithOffer else { return }
        cell.cellConfigure(model: models)
    }
    
    // MARK: - Router
    
    func goToCart() {
        router.goToCart()
    }
    
    func goToMenu() {
        router.goToMenu()
    }
}
