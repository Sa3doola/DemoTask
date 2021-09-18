//
//  OrderDetailsViewController.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/18/21.
//

import UIKit

final class OrderDetailsViewController: UIViewController {
    
    var configurator = OrderDetailsConfiguratorImplementation()
    
    var presenter: OrderDetailsPresenter?
    
    // MARK: - UIViewController Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(OrderDetailsViewController: self)
        presenter?.viewDidLoad()
    }
    
}



extension OrderDetailsViewController: OrderDetailsView {}
