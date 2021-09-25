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

// Cell

protocol SlideImageCellView {
    func cellConfigure(model: [Slide])
}

protocol RandomCategoryCellView {
    func cellConfigure(model: HomeCategory)
}

// Collection Cells

protocol MainHomePresenter {
    func viewDidLoad()
    
    // Cell with View
    func configure(cell: SlideImageCellView)
    func configure(cell: RandomCategoryCellView)
    
    // CellWithCollection
    /// CatagoryCell
    func configreCategoryTableCell(cell: CategoryTableViewCell)
    var numberOfCategoriesRows: Int { get }
    func configureCategoryCollectionCell(cell: CategoryCollectionCell, row: Int)
    func didSelectCategory(row: Int)
    
    /// OfferCell
    func configureOfferTableCell(cell: OfferTableViewCell)
    var numberOfOfferRows: Int { get }
    func configureOfferCollectionCell(cell: OfferCollectionCell, row: Int)
    func didSelectOffer(row: Int)
    // Router
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

    
    func configure(cell: RandomCategoryCellView) {
        guard let model = self.randomCategory else { return }
        cell.cellConfigure(model: model)
    }
    
    // MARK: - TableCellConfigure with Collections
    
    func configreCategoryTableCell(cell: CategoryTableViewCell) {
        cell.reloadData()
    }
    
    
    var numberOfCategoriesRows: Int {
        return categories?.count ?? 0
    }
    
    func configureCategoryCollectionCell(cell: CategoryCollectionCell, row: Int) {
        guard let data = categories?[row] else { return }
        cell.configre(model: data)
    }
    
    func didSelectCategory(row: Int) {
       print("cellRow: \(row)")
    }
    
    func configureOfferTableCell(cell: OfferTableViewCell) {
        cell.reloadData()
    }
    
    var numberOfOfferRows: Int {
        return serviceWithOffer?.count ?? 0
    }
    
    func configureOfferCollectionCell(cell: OfferCollectionCell, row: Int) {
        guard let data = serviceWithOffer?[row] else { return }
        cell.configre(model: data)
    }
    
    func didSelectOffer(row: Int) {
        guard let data = serviceWithOffer?[row] else { return }
        router.goToOffer(data)
    }
    
    // MARK: - Router
    
    func goToCart() {
        router.goToCart()
    }
    
    func goToMenu() {
        router.goToMenu()
    }
}
