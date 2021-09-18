//
//  MainHomeRouter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import UIKit


protocol MainHomeRouter {
    func goToOffer()
    func goToCategory()
}

class MainHomeRouterImplementation: MainHomeRouter {
    
    
    fileprivate weak var MainHomeViewController: MainHomeViewController?
    
    let home = Storyboard.homeSrotyboard
    init(MainHomeViewController: MainHomeViewController) {
        self.MainHomeViewController = MainHomeViewController
    }
    
    func goToOffer() {
        let vc: ProductViewController = home.instantiateViewController()
        self.MainHomeViewController?.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func goToCategory() {
        let vc: CategoryViewController = home.instantiateViewController()
        self.MainHomeViewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
