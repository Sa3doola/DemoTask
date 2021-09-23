//
//  RandomTableCell.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/22/21.
//

import UIKit
import SDWebImage

class RandomTableCell: UITableViewCell, RandomCategoryCellView {

    @IBOutlet weak var randomImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var discriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func cellConfigure(model: HomeCategory) {
        randomImage.sd_setImage(with: model.image, completed: nil)
        nameLabel.text = model.name
        discriptionLabel.text = model.categoryDescription
    }
    
}
