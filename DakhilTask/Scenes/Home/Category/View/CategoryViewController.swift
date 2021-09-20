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
    }
    
    // MARK: - Helper Functions
    
    private func configureTable() {
        categoriesTableView.register(UINib(nibName: "CategoryTableCell", bundle: nil),
                                     forCellReuseIdentifier: "CategoryTableCell")
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
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableCell",
                                                       for: indexPath) as? CategoryTableCell else { return UITableViewCell() }
        presenter?.configure(cell: cell, forRow: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - CategoryView

extension CategoryViewController: CategoryView {}
