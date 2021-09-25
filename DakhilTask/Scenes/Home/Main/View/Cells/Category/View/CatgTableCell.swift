//
//  CatgTableCell.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/22/21.
//

import UIKit

protocol CategoryTableViewCell {
    func reloadData()
    var presenter: MainHomePresenter? { get }
}

class CatgTableCell: UITableViewCell, CategoryTableViewCell {
    
    // MARK: - Properties
    
    static let id  = String(describing: CatgTableCell.self)
    
    var presenter: MainHomePresenter?
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    // MARK: - awakeFromNib
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCollection()
    }
    
    // MARK: - Helper Functions

    func configureCollection() {
        categoryCollectionView.register(UINib(nibName: "CategoryCollecCell", bundle: nil),
                                        forCellWithReuseIdentifier: "CategoryCollecCell")
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
    }
    
    func reloadData() {
        self.categoryCollectionView.reloadData()
    }
    
    // MARK: - IBActions
    
    @IBAction func showAllWasTapped(_ sender: UIButton) {
        print("Show All ")
    }
}

// MARK: - UICollectionViewDelegate and DataSource

extension CatgTableCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.numberOfCategoriesRows ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollecCell", for: indexPath) as? CategoryCollecCell else { return UICollectionViewCell() }
        presenter?.configureCategoryCollectionCell(cell: cell, row: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        presenter?.didSelectCategory(row: indexPath.row)
    }
}
