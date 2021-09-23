//
//  CatgTableCell.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/22/21.
//

import UIKit

protocol CellDelegate: class {
    func setModels(models: [HomeCategory])
}

class CatgTableCell: UITableViewCell, CategoryHomeCellView {
    
    var configurator = CategoryCellConfiguratorImplementation()
    
    var presenter: CategoryCellPresenter?
    
    weak var delegate: CellDelegate?
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configurator.configure(CategoryTableCell: self)
        presenter?.viewDidLoad()
        configureCollection()
    }

    func configureCollection() {
        categoryCollectionView.register(UINib(nibName: "CategoryCollecCell", bundle: nil),
                                        forCellWithReuseIdentifier: "CategoryCollecCell")
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
    }
    
    func cellConfigure(model: [HomeCategory]) {
        self.delegate?.setModels(models: model)
    }
    
    @IBAction func showAllWasTapped(_ sender: UIButton) {
        
    }
}

extension CatgTableCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.numberOfRows() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollecCell", for: indexPath) as? CategoryCollecCell else { return UICollectionViewCell() }
        presenter?.configure(cell: cell, at: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension CatgTableCell: CatCellView {
    func setDelegate(delegate: CellDelegate) {
        self.delegate = delegate
    }
    
    func reloadData() {
        self.categoryCollectionView.reloadData()
    }
}
