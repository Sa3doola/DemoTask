//
//  OfferTableCell.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/22/21.
//

import UIKit

protocol OfferCellDelegate: class {
    func setModels(models: [ProductModel])
}

class OfferTableCell: UITableViewCell, ProductHomeCellView {
    
    var configurator = OfferCellConfiguratorImplementaion()
    
    var presenter: OfferCellPresenter?
    
    weak var delegate: OfferCellDelegate?
    
    @IBOutlet weak var offerCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configurator.configure(OfferTableCell: self)
        presenter?.viewDidLoad()
        configureCollection()
    }
    
    func configureCollection() {
        offerCollectionView.register(UINib(nibName: "OfferCell", bundle: nil),
                                     forCellWithReuseIdentifier: "OfferCell")
        offerCollectionView.delegate = self
        offerCollectionView.dataSource = self
    }
    
    func cellConfigure(model: [ProductModel]) {
        self.delegate?.setModels(models: model)
    }
}

extension OfferTableCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.numberOfRows() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OfferCell", for: indexPath) as? OfferCell else {
            return UICollectionViewCell()
        }
        presenter?.configure(cell: cell, at: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        presenter?.didSelect(row: indexPath.row)
    }
}

extension OfferTableCell: OfferTableCellView {
    
    func setDelegate(delegate: OfferCellDelegate) {
        self.delegate = delegate
    }
    
    func reloadData() {
        offerCollectionView.reloadData()
    }
}
