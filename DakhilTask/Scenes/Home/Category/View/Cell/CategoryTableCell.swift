//
//  CategoryTableCell.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/18/21.
//

import UIKit
import SDWebImage

class CategoryTableCell: UITableViewCell, CategoryCellView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(model: ProductModel) {
//        self.productImage.sd_setImage(with: model.image, completed: nil)
//        guard let distance = model.distance else { return }
//        self.providerNameLabel.text = model.providerName
//        self.distanceLabel.text = "\(distance)KM"
//        guard let rate = model.avgRate else { return }
//        self.rateLabel.text = "\(rate)"
    }
    
}
