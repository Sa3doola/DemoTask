//
//  ProductViewController.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/18/21.
//

import UIKit
import SDWebImage

final class ProductViewController: UIViewController {
    
    // MARK: - Properties
    
    var configurator: ProductConfiguratorImplementation!
    
    var presenter: ProductPresenter?
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var ProductImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var mesaaementLabel: UILabel!
    @IBOutlet weak var precentDiscountLabel: UILabel!
    @IBOutlet weak var discriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    // MARK: - UIViewController Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(ProductViewController: self)
        presenter?.viewDidLoad()
    }
    
    // MARK: - IBActions
    
    @IBAction func dismissBtnWasTapped(_ sender: UIButton) {
        presenter?.backToHome()
    }
    
    @IBAction func favBtnWasTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func cartBtnWasTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func lessBtnWasTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func addBtnWasTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func addToCartWasTapped(_ sender: UIButton) {
        
    }
}

// MARK: - ProductView

extension ProductViewController: ProductView {
    
    func configureView(model: ServiceWithOffer) {
        self.ProductImageView.sd_setImage(with: model.image, completed: nil)
        guard let discount = model.discountPercentage else { return }
        self.priceLabel.text = "\(discount)%"
        
    }
}
