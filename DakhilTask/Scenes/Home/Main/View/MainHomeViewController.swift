//
//  MainHomeViewController.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import UIKit
import SideMenu

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
        mainTableView.register(UINib(nibName: "SlideImageCell", bundle: nil),
                               forCellReuseIdentifier: "SlideImageCell")
        mainTableView.register(UINib(nibName: "CatgTableCell", bundle: nil),
                               forCellReuseIdentifier: "CatgTableCell")
        mainTableView.register(UINib(nibName: "RandomTableCell", bundle: nil),
                               forCellReuseIdentifier: "RandomTableCell")
        mainTableView.register(UINib(nibName: "OfferTableCell", bundle: nil),
                               forCellReuseIdentifier: "OfferTableCell")
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
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SlideImageCell", for: indexPath) as? SlideImageCell else { return UITableViewCell() }
            presenter?.configure(cell: cell)
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CatgTableCell.id, for: indexPath) as? CatgTableCell else { return UITableViewCell() }
            cell.presenter = self.presenter
            presenter?.configreCategoryTableCell(cell: cell)
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "RandomTableCell", for: indexPath) as? RandomTableCell else { return UITableViewCell() }
            presenter?.configure(cell: cell)
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "OfferTableCell", for: indexPath) as? OfferTableCell else { return UITableViewCell() }
            cell.presenter = self.presenter
            presenter?.configureOfferTableCell(cell: cell)
            return cell
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - MainHomeView

extension MainHomeViewController: MainHomeView {
    func reloadData() {
        self.mainTableView.reloadData()
    }
}
