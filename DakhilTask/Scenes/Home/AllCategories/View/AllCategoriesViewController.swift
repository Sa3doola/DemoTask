//
//  AllCategoriesViewController.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/26/21.
//

import UIKit

enum PaginateSection: CaseIterable {
    case CategoryCell
    case LoadingCell
}

final class AllCategoriesViewController: UIViewController {
    
    // MARK: - Properties
    
    var configurator = AllCategoriesConfiguratorImplementation()
    
    var presenter: AllCategoriesPresenter?
    
    var isLoading: Bool = false
    var currentPage: Int = 1
    
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
        tableView.register(cell: LoadingCell.self)
    }
    
    private func loadMoreData() {
        guard let totalPage = presenter?.totalPage else { return }
        if currentPage < totalPage && !isLoading {
            isLoading = true
            currentPage += 1
            presenter?.fetchMoreData(page: currentPage)
            if isLoading {
                self.isLoading = false
                self.tableView.tableFooterView = nil
            }
            if totalPage == currentPage {
                self.isLoading = false
                
            }
        }
    }
    
    // MARK: - IBActions
    
    @IBAction func backWasTapped(_ sender: UIButton) {
        presenter?.back()
    }
    
    @IBAction func cartWasTapped(_ sender: UIButton) {
        
    }
}

// MARK: - UITableViewDelegate and DataSource

extension AllCategoriesViewController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let number = presenter?.numberOfRow else { return }
        
        if indexPath.row  == number - 1 && !isLoading {
            self.tableView.tableFooterView = createSpinnerFooter()
            loadMoreData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.didSelect(row: indexPath.row)
    }
    
    func createSpinnerFooter() -> UIView? {
        
        guard let totalPage = presenter?.totalPage else { return nil }
        
        if currentPage != totalPage {
            let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: 100))
            let spinner = UIActivityIndicatorView(style: .large)
            spinner.color = .black
            spinner.center = footer.center
            footer.addSubview(spinner)
            spinner.startAnimating()
            return footer
        }
        
        return nil
    }
}

// MARK: - AllCategoriesView

extension AllCategoriesViewController: AllCategoriesView {
    
    func reloadData() {
        self.tableView.reloadData()
    }
}
