//
//  OfferCellRouter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/23/21.
//

import Foundation

protocol OfferCellRouter {
    func goToOffer(_ model: ProductModel)
}

class OfferCellRouterImplementaion: OfferCellRouter {
    
    fileprivate weak var OfferTableCell: OfferTableCell?
    
    init(OfferTableCell: OfferTableCell) {
        self.OfferTableCell = OfferTableCell
    }
    
    let home = Storyboard.homeSrotyboard
    
    func goToOffer(_ model: ProductModel) {
        let vc: ProductViewController = home.instantiateViewController()
        vc.configurator = ProductConfiguratorImplementation(model: model)
        
    }
}
