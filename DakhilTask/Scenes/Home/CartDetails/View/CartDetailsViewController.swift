//
//  CartDetailsViewController.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import UIKit

final class CartDetailsViewController: UIViewController {
    
    var configurator = CartDetailsConfiguratorImplementation()
    
    var presenter: CartDetailsPresenter?
    
    // MARK: - UIViewController Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(CartDetailsViewController: self)
        presenter?.viewDidLoad()
    }
    
}



extension CartDetailsViewController: CartDetailsView {}
