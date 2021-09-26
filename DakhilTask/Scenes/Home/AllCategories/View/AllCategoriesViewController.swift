//
//  AllCategoriesViewController.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/26/21.
//

import UIKit

final class AllCategoriesViewController: UIViewController {
    
    // MARK: - Properties
    
    var configurator = AllCategoriesConfiguratorImplementation()
    
    var presenter: AllCategoriesPresenter?
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var searchTxtField: UITextField!
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - UIViewController Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(AllCategoriesViewController: self)
        presenter?.viewDidLoad()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    // MARK: - Helper Functions
    
    private func configureTableView() {
        tableView.register(cell: AllCategoriesTableCell.self)
    }
    
    // MARK: - IBActions
    
    @IBAction func backWasTapped(_ sender: UIButton) {
        presenter?.back()
    }
    
    @IBAction func cartWasTapped(_ sender: UIButton) {
        
    }
}

// MARK: - UITableViewDelegate and DataSource

extension AllCategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRow ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(indexPath: indexPath) as AllCategoriesTableCell
        presenter?.configure(cell: cell, forRow: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.didSelect(row: indexPath.row)
    }
    
    
}

// MARK: - AllCategoriesView

extension AllCategoriesViewController: AllCategoriesView {
    
    func reloadData() {
        self.tableView.reloadData()
    }
    
}
