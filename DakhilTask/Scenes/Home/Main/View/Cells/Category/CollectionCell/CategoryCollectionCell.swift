//
//  CategoryCell.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import UIKit
import SDWebImage

class CategoryCollectionCell: UICollectionViewCell {
    
    
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

//    func cellConfigure(model: HomeCategory) {
//        self.categoryName.text = model.name
//        self.categoryImage.sd_setImage(with: model.image, completed: nil)
//    }
}
