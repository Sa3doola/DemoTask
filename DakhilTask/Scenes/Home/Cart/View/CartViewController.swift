//
//  CartViewController.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import UIKit

final class CartViewController: UIViewController {
    
    var configurator = CartConfiguratorImplementation()
    
    var presenter: CartPresenter?
    
    // MARK: - UIViewController Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(CartViewController: self)
        presenter?.viewDidLoad()
    }
    
}



extension CartViewController: CartView {}
