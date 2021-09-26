//
//  CartViewController.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import UIKit

final class CartViewController: UIViewController {
    
    // MARK: - Properties
    
    var configurator = CartConfiguratorImplementation()
    
    var presenter: CartPresenter?
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var cartTableView: UITableView!
    
    // MARK: - UIViewController Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(CartViewController: self)
        presenter?.viewDidLoad()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        tabBarController?.tabBar.isHidden = true
    }
    
    // MARK: - Helper Functions
    
    private func configureTableView() {
        cartTableView.register(cell: CartTableCell.self)
    }
    
}

// MARK: - UITableViewDelegate and DataSource

extension CartViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfData() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(indexPath: indexPath) as CartTableCell
        presenter?.configure(cell: cell, forRow: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.deSelect(at: indexPath.row)
    }
}


extension CartViewController: CartView {
    func reloadData() {
        self.cartTableView.reloadData()
    }
}
