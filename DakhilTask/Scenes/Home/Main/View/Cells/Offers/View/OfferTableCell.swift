//
//  OfferTableCell.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/22/21.
//

import UIKit

protocol OfferTableViewCell {
    func reloadData()
    var presenter: MainHomePresenter? { get }
}

class OfferTableCell: UITableViewCell, OfferTableViewCell {
    
    var presenter: MainHomePresenter?
    
    @IBOutlet weak var offerCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCollection()
    }
    
    func configureCollection() {
        offerCollectionView.register(UINib(nibName: "OfferCell", bundle: nil),
                                     forCellWithReuseIdentifier: "OfferCell")
        offerCollectionView.delegate = self
        offerCollectionView.dataSource = self
    }
    
    func reloadData() {
        self.offerCollectionView.reloadData()
    }
}

extension OfferTableCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.numberOfOfferRows ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OfferCell", for: indexPath) as? OfferCell else {
            return UICollectionViewCell()
        }
        presenter?.configureOfferCollectionCell(cell: cell, row: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        presenter?.didSelectOffer(row: indexPath.row)
    }
}
