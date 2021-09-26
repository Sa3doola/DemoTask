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
        tableView.register(UINib(nibName: "AllCategoriesTableCell", bundle: nil),
                           forCellReuseIdentifier: "AllCategoriesTableCell")
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRow ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AllCategoriesTableCell", for: indexPath) as? AllCategoriesTableCell else { return UITableViewCell() }
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
