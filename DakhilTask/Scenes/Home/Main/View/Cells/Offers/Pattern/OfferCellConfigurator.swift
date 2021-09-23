//
//  OfferCellConfigurator.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/23/21.
//

import Foundation

protocol OfferCellConfigurator {
    func configure(OfferTableCell: OfferTableCell)
}

class OfferCellConfiguratorImplementaion {

    func configure(OfferTableCell: OfferTableCell) {
        let view = OfferTableCell
        let router = OfferCellRouterImplementaion(OfferTableCell: view)
        
        let presenter = OfferCellPresenterImplementaion(view: view, router: router)
        
        OfferTableCell.presenter = presenter
    }
}


