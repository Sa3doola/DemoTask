//
//  MainHomeRouter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import UIKit


protocol MainHomeRouter {
    func goToOffer(_ model: ProductModel)
    func goToCategory(_ model: ProductModel)
    func goToCart()
    func goToMenu()
}

class MainHomeRouterImplementation: MainHomeRouter {
    
    
    fileprivate weak var MainHomeViewController: MainHomeViewController?
    
    let home = Storyboard.homeSrotyboard
    init(MainHomeViewController: MainHomeViewController) {
        self.MainHomeViewController = MainHomeViewController
    }
    
    func goToCart() {
        let vc: CartViewController = home.instantiateViewController()
        self.MainHomeViewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToOffer(_ model: ProductModel) {
        let vc: ProductViewController = home.instantiateViewController()
        vc.configurator = ProductConfiguratorImplementation(model: model)
        self.MainHomeViewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToCategory(_ model: ProductModel) {
        let vc: CategoryViewController = home.instantiateViewController()
        vc.configurator = CategoryConfiguratorImplementation(model: model)
        self.MainHomeViewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToMenu() {
        let vc = QuestionsViewController()
        vc.modalPresentationStyle = .fullScreen
        self.MainHomeViewController?.present(vc, animated: true, completion: nil)
    }
}
