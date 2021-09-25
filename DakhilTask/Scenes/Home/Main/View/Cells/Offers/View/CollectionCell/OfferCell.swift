//
//  OfferCell.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import UIKit
import SDWebImage

protocol OfferCollectionCell {
    func configre(model: ProductModel)
}

class OfferCell: UICollectionViewCell, OfferCollectionCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var precentDicountLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var sellerNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var measurmentLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configre(model: ProductModel) {
        productImage.sd_setImage(with: model.image, completed: nil)
        
    }
  
    @IBAction func favBtnWasTapped(_ sender: UIButton) {
        print("Fav Was Tapped")
    }
}
