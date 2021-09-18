//
//  MainHomeViewController.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import UIKit

final class MainHomeViewController: UIViewController {
    
    // MARK: - Properties
    
    var configurator = MainHomeConfiguratorImplementation()
    
    var presenter: MainHomePresenter?
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var offerCollectionView: UICollectionView!
    
    // MARK: - UIViewController Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(MainHomeViewController: self)
        presenter?.viewDidLoad()
        configureCollection()
        let token = UserDefaults.standard.loadToken()
        print("token: \(String(describing: token))")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Helper Functions
    
    private func configureCollection() {
        categoryCollectionView.register(UINib(nibName: "CategoryCell", bundle: nil),
                                        forCellWithReuseIdentifier: "CategoryCell")
        offerCollectionView.register(UINib(nibName: "OfferCell", bundle: nil),
                                     forCellWithReuseIdentifier: "OfferCell")
    }
    
    // MARK: - IBActions
}

// MARK: - UICollectionViewDelegate and DataSource

extension MainHomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let tag = collectionView.tag
        
        switch tag {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as? CategoryCell else { return UICollectionViewCell() }
            presenter?.configure(cell: cell, forRow: indexPath.row)
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OfferCell", for: indexPath) as? OfferCell else { return UICollectionViewCell() }
            presenter?.configure(cell: cell, forRow: indexPath.row)
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let tag = collectionView.tag
        
        switch tag {
        case 0:
            presenter?.deSelectCategory(at: indexPath.row)
        case 1:
            presenter?.deSelectProduct(at: indexPath.row)
        default:
            print("non")
        }
    }

}


extension MainHomeViewController: MainHomeView {}
