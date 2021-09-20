//
//  CartTableCell.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/19/21.
//

import UIKit
import SDWebImage

class CartTableCell: UITableViewCell, CartCellView {

    
    // MARK: - IBOutlets
    
    @IBOutlet weak var cellMainView: UIView!
    @IBOutlet weak var CellImageView: UIImageView!
    @IBOutlet weak var providerNameLabel: UILabel!
    @IBOutlet weak var distaceLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var rateView: UIView!
    
    
    func configure(model: CartData) {
        self.CellImageView.sd_setImage(with: model.providerImage, completed: nil)
        self.addressLabel.text = model.address
        self.providerNameLabel.text = model.providerName
        guard let distance = model.distance else { return }
        self.distaceLabel.text = "\(distance)"
        guard let rate = model.providerRate else { return }
        self.rateLabel.text = "\(rate)"
    }
    
}
