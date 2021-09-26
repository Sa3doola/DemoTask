//
//  CategoryTableCell.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/18/21.
//

import UIKit
import SDWebImage

class CategoryTableCell: UITableViewCell, CategoryCellView {
    
    @IBOutlet weak var catImageView: UIImageView!
    @IBOutlet weak var providerName: UILabel!
    @IBOutlet weak var disatnceLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(model: ProductModel) {
        self.catImageView.sd_setImage(with: model.image, completed: nil)
        guard let distance = model.distance else { return }
        self.providerName.text = model.providerName
        self.disatnceLabel.text = "\(distance)KM"
        guard let rate = model.avgRate else { return }
        self.rateLabel.text = "\(rate)"
    }
    
}
