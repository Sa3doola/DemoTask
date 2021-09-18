//
//  MainHomeRouter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import UIKit


protocol MainHomeRouter {
    func goToOffer(_ model: ServiceWithOffer)
    func goToCategory(_ model: HomeCategory)
}

class MainHomeRouterImplementation: MainHomeRouter {
    
    
    fileprivate weak var MainHomeViewController: MainHomeViewController?
    
    let home = Storyboard.homeSrotyboard
    init(MainHomeViewController: MainHomeViewController) {
        self.MainHomeViewController = MainHomeViewController
    }
    
    func goToOffer(_ model: ServiceWithOffer) {
        let vc: ProductViewController = home.instantiateViewController()
        vc.configurator = ProductConfiguratorImplementation(model: model)
        self.MainHomeViewController?.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func goToCategory(_ model: HomeCategory) {
        let vc: CategoryViewController = home.instantiateViewController()
        vc.configurator = CategoryConfiguratorImplementation(model: model)
        self.MainHomeViewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
