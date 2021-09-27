//
//  MainHomeViewController.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import UIKit
import SideMenu

enum TableSections: CaseIterable {
    case sideImage
    case categories
    case randomCategory
    case offers
}

final class MainHomeViewController: UIViewController {
    
    // MARK: - Properties
    
    var configurator = MainHomeConfiguratorImplementation()
    
    var presenter: MainHomePresenter?
    
    var sideMenu: SideMenuNavigationController?
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var mainTableView: UITableView!
    
    // MARK: - UIViewController Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(MainHomeViewController: self)
        DispatchQueue.main.async {
            self.presenter?.viewDidLoad()
        }
        configureTableView()
        configureSideMenu()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: - Helper Functions
    
    private func configureTableView() {
        mainTableView.register(cell: SlideImageCell.self)
        mainTableView.register(cell: CatgTableCell.self)
        mainTableView.register(cell: RandomTableCell.self)
        mainTableView.register(cell: OfferTableCell.self)
    }
    
    private func configureSideMenu() {
        let homeStoryboard = Storyboard.homeSrotyboard
        let vc: SideMenuViewController = homeStoryboard.instantiateViewController()
        sideMenu = SideMenuNavigationController(rootViewController: vc)
        sideMenu?.alwaysAnimate = true
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        sideMenu?.leftSide = true
        sideMenu?.menuWidth = self.view.width - 90
    }
    
    // MARK: - IBActions
    
    @IBAction func sideMenuWasTapped(_ sender: UIButton) {
        present(sideMenu!, animated: true, completion: nil)
    }
    
    @IBAction func notificationWasTapped(_ sender: UIButton) {
        print("Notification")
    }
    
    @IBAction func cartWasTapped(_ sender: UIButton) {
        presenter?.goToCart()
    }
}

// MARK: - UITableViewDelegate and DataSource

extension MainHomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return TableSections.allCases.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = TableSections.allCases[indexPath.section]
        
        switch section {
        
        case .sideImage:
            let cell = tableView.dequeueCell(indexPath: indexPath) as SlideImageCell
            presenter?.configure(cell: cell)
            return cell
        case .categories:
            let cell = tableView.dequeueCell(indexPath: indexPath) as CatgTableCell
            cell.presenter = self.presenter
            presenter?.configreCategoryTableCell(cell: cell)
            return cell
        case .randomCategory:
            let cell = tableView.dequeueCell(indexPath: indexPath) as RandomTableCell
            presenter?.configure(cell: cell)
            return cell
        case .offers:
            let cell = tableView.dequeueCell(indexPath: indexPath) as OfferTableCell
            cell.presenter = self.presenter
            presenter?.configureOfferTableCell(cell: cell)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let section = TableSections.allCases[indexPath.section]
        if section == .randomCategory {
            presenter?.goToRandomCategory()
        }
    }
}

// MARK: - MainHomeView

extension MainHomeViewController: MainHomeView {
    
    func reloadData() {
        self.mainTableView.reloadData()
    }
}
