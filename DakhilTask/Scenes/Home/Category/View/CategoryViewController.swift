//
//  CategoryViewController.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import UIKit

final class CategoryViewController: UIViewController {
    
    var configurator: CategoryConfiguratorImplementation!
    
    var presenter: CategoryPresenter?
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var searchTxtField: UITextField!
    @IBOutlet weak var categoriesTableView: UITableView!
    @IBOutlet weak var noDataLabel: UILabel!
    
    // MARK: - UIViewController Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(CategoryViewController: self)
        presenter?.viewDidLoad()
        configureTable()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isHidden = true
    }
    
    // MARK: - Helper Functions
    
    private func configureTable() {
        categoriesTableView.register(cell: CategoryTableCell.self)
    }
    
    // MARK: - IBActions
    
    @IBAction func backBtnWasTapped(_ sender: UIButton) {
        presenter?.backToHome()
    }
    
    @IBAction func cartBtnWasTapped(_ sender: UIButton) {
        presenter?.goToCart()
    }
    
    @IBAction func filterBtnWasTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func specialOrderWasTapped(_ sender: UIButton) {
        
    }
}

// MARK: - UITableViewDelegate and DataSource

extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(indexPath: indexPath) as CategoryTableCell
        presenter?.cellConfigure(cell: cell, row: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - CategoryView

extension CategoryViewController: CategoryView {
    func reloadData() {
        self.categoriesTableView.reloadData()
    }
    
    func hideTableView() {
        self.categoriesTableView.isHidden = true
        self.noDataLabel.isHidden = false
    }
    
    func showTableView() {
        self.noDataLabel.isHidden = true
        self.categoriesTableView.isHidden = false
    }
}
