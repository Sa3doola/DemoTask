//
//  OfferCell.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import UIKit
import SDWebImage

class OfferCell: UICollectionViewCell, OfferCollectionCellView{
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var precentDicountLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var sellerNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var measurmentLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func cellConfigure(model: ProductModel) {
        self.productImage.sd_setImage(with: model.image, completed: nil)
          guard let discount = model.discountPercentage else { return }
          self.precentDicountLabel.text = "\(discount)%"
          self.productNameLabel.text = model.name
          self.sellerNameLabel.text = model.providerName
          guard let price = model.priceAfterDiscount else { return }
          self.priceLabel.text = "\(price)SR"
          self.measurmentLabel.text = model.measurement
          guard let distance = model.distance else { return }
          self.distanceLabel.text = "\(distance))km"
    }


    @IBAction func favBtnWasTapped(_ sender: UIButton) {
        print("Fav Was Tapped")
    }
}
