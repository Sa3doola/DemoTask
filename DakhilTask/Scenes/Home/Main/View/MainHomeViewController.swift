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
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CatgTableCell", for: indexPath) as? CatgTableCell else { return UITableViewCell() }
            presenter?.configure(cell: cell)
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "RandomTableCell", for: indexPath) as? RandomTableCell else { return UITableViewCell() }
            presenter?.configure(cell: cell)
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "OfferTableCell", for: indexPath) as? OfferTableCell else { return UITableViewCell() }
            presenter?.configure(cell: cell)
            return cell
        default:
            return UITableViewCell()
        }
    }
}

//    @objc private func didTapImageSlider() {
//    }
//
//    @IBAction func sideMenuWasTapped(_ sender: UIButton) {
//        present(sideMenu!, animated: true, completion: nil)
//    }
//
//    @IBAction func favBtnWasTapped(_ sender: UIButton) {
//
//    }
//
//    @IBAction func cartBtnWasTapped(_ sender: UIButton) {
//        presenter?.goToCart()
//    }
//
//    @IBAction func showAllWasTapped(_ sender: UIButton) {
//
//    }

//extension MainHomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        let tag = collectionView.tag
//        switch tag {
//        case 0:
//            return presenter?.numberOfCategories() ?? 0
//        case 1:
//            return presenter?.numberOfProducts() ?? 0
//        default:
//            return 1
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let tag = collectionView.tag
//
//        switch tag {
//        case 0:
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as? CategoryCell else { return UICollectionViewCell() }
//            presenter?.configure(cell: cell, forRow: indexPath.row)
//            return cell
//        case 1:
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OfferCell", for: indexPath) as? OfferCell else { return UICollectionViewCell() }
//            presenter?.configure(cell: cell, forRow: indexPath.row)
//            return cell
//        default:
//            return UICollectionViewCell()
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        collectionView.deselectItem(at: indexPath, animated: true)
//        let tag = collectionView.tag
//
//        switch tag {
//        case 0:
//            presenter?.deSelectCategory(at: indexPath.row)
//        case 1:
//            presenter?.deSelectProduct(at: indexPath.row)
//        default:
//            print("non")
//        }
//    }
//}

// MARK: - MainHomeView

extension MainHomeViewController: MainHomeView {
    func reloadData() {
        self.mainTableView.reloadData()
    }
}

//func reloadCollectionData() {
//        self.categoryCollectionView.reloadData()
//        self.offerCollectionView.reloadData()
//    }
