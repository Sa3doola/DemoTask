//
//  OrderDetailsCell.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/19/21.
//

import UIKit
import SDWebImage

protocol DidUpdateOrderAmount {
    func updateOrderAmountCell(amount: Int, orderId: Int)
}

class OrderDetailsCell: UITableViewCell, OrderDetailsCellView {
    
    
    // MARK: - Properties
    
    private var model: Service?
    
    var delegate: DidUpdateOrderAmount?
    
    var amount: Int = 0 {
        didSet {
            amountLabel.text = "\(amount)"
        }
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    // MARK: - OrderDetailsCellView
    
    func configreCell(_ model: Service) {
        self.model = model
        configure(model: model)
    }
    
    func configure(model: Service) {
        self.productImage.sd_setImage(with: model.serviceImage, completed: nil)
        self.amount = model.amount!
        self.productName.text = model.serviceMeasurement
        guard let price = model.servicePrice else { return }
        self.priceLabel.text = "\(price)SR"
    }
    
    // MARK: - Helper Functions
    
    func updateOrderAmount() {
        guard let id = self.model?.id else { return }
        self.delegate?.updateOrderAmountCell(amount: self.amount, orderId: id)
    }
    
    // MARK: - IBActions
    
    @IBAction func lessAmountWasTapped(_ sender: UIButton) {
        amount -= 1
        updateOrderAmount()
    }
    
    @IBAction func addAmountWasTapped(_ sender: UIButton) {
        amount += 1
        updateOrderAmount()
    }
}
