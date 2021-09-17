//
//  CategoryViewController.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import UIKit

final class CategoryViewController: UIViewController {
    
    var configurator = CategoryConfiguratorImplementation()
    
    var presenter: CategoryPresenter?
    
    // MARK: - UIViewController Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(CategoryViewController: self)
        presenter?.viewDidLoad()
    }
    
}



extension CategoryViewController: CategoryView {}
