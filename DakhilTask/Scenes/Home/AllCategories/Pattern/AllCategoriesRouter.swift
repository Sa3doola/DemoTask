//
//  AllCategoriesRouter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/26/21.
//

import UIKit


protocol AllCategoriesRouter {
    func goToCategory()
    func back()
}

class AllCategoriesRouterImplementation: AllCategoriesRouter {
    
    fileprivate weak var AllCategoriesViewController: AllCategoriesViewController?
    
    let home = Storyboard.homeSrotyboard
    
    init(AllCategoriesViewController: AllCategoriesViewController) {
        self.AllCategoriesViewController = AllCategoriesViewController
    }
    
    let model = ProductModel(id: 12, status: "", image: URL(string: ""), name: "", nameAr: "", nameEn: "", categoryID: 12, categoryName: "", measurement: "", measurementID: 12, avgRate: 12, discountPercentage: 12, discountStatus: "", serviceWithOfferDescription: "", descriptionAr: "", descriptionEn: "", price: 12, originalPrice: 12, priceAfterDiscount: 12, providerID: 12, providerName: "", storeName: "", distance: 12, isFavourit: "")
    
    func goToCategory() {
        let vc: CategoryViewController = home.instantiateViewController()
        vc.configurator = CategoryConfiguratorImplementation(model: model)
        self.AllCategoriesViewController?.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func back() {
        self.AllCategoriesViewController?.navigationController?.popViewController(animated: true)
    }
}
