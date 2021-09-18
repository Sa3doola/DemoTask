//
//  ProductViewController.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/18/21.
//

import UIKit

final class ProductViewController: UIViewController {
    
    var configurator: ProductConfiguratorImplementation!
    
    var presenter: ProductPresenter?
    
    // MARK: - UIViewController Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(ProductViewController: self)
        presenter?.viewDidLoad()
    }

    
}



extension ProductViewController: ProductView {}
