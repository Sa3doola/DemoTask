//
//  CategoryCollecCell.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/23/21.
//

import UIKit
import SDWebImage

protocol CategoryCollectionCell {
    func configre(model: Categorry)
}

class CategoryCollecCell: UICollectionViewCell, CategoryCollectionCell {

    @IBOutlet weak var CategoryImage: UIImageView!
    @IBOutlet weak var categoryNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configre(model: Categorry) {
        CategoryImage.sd_setImage(with: model.image, completed: nil)
        categoryNameLabel.text = model.name
    }
}
