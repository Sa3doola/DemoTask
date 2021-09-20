//
//  ProductViewController.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/18/21.
//

import UIKit
import CoreLocation
import SDWebImage

final class ProductViewController: UIViewController {
    
    // MARK: - Properties
    
    var configurator: ProductConfiguratorImplementation!
    
    var presenter: ProductPresenter?
    var locationManager = CLLocationManager()
    
    var amount = 1 {
        didSet {
            amountLabel.text = "\(amount)"
        }
    }
    var lat: Double!
    var lng: Double!
    
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
        DispatchQueue.main.async {
            self.locationManager.requestWhenInUseAuthorization()
            if CLLocationManager.locationServicesEnabled() {
                self.locationManager.delegate = self
                self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                self.locationManager.startUpdatingLocation()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Helper Functions
    
    func addToCart() {
        if lng != nil {
            presenter?.addToCart(amount: self.amount,
                                 lat: self.lat,
                                 lng: self.lng)
        }
    }
    
    // MARK: - IBActions
    
    @IBAction func dismissBtnWasTapped(_ sender: UIButton) {
        presenter?.backToHome()
    }
    
    @IBAction func favBtnWasTapped(_ sender: UIButton) {
        print("Fav WasTapped")
    }
    
    @IBAction func cartBtnWasTapped(_ sender: UIButton) {
        presenter?.goToCart()
    }
    
    @IBAction func lessBtnWasTapped(_ sender: UIButton) {
        amount -= 1
    }
    
    @IBAction func addBtnWasTapped(_ sender: UIButton) {
        amount += 1
    }
    
    @IBAction func addToCartWasTapped(_ sender: UIButton) {
        addToCart()
    }
}

// MARK: - ProductView

extension ProductViewController: ProductView {
    
    func configureView(model: ProductModel) {
        self.ProductImageView.sd_setImage(with: model.image, completed: nil)
        self.productNameLabel.text = model.categoryName
        guard let discount = model.discountPercentage else { return }
        self.priceLabel.text = "\(discount)%"
        self.mesaaementLabel.text = model.measurement
        self.discriptionLabel.text = model.descriptionEn
        guard let price = model.priceAfterDiscount else { return }
        self.priceLabel.text = "\(price)SR"
        self.amountLabel.text = "1"
    }
    
    func showActionSheet() {
        let alert = UIAlertController(title: "Add To Cart", message: "", preferredStyle: .actionSheet)
        let keepAction = UIAlertAction(title: "KeepShoping", style: .default) { (action) in
            self.presenter?.backToHome()
        }
        
        let goToCartAction = UIAlertAction(title: "Go To Cart", style: .default) { (action) in
            self.presenter?.goToCart()
        }
        alert.addAction(keepAction)
        alert.addAction(goToCartAction)
        self.present(alert, animated: true, completion: nil)
    }
}

extension ProductViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let lat = location.coordinate.latitude
        let lng = location.coordinate.longitude
        
        self.lat = lat
        self.lng = lng
        locationManager.stopUpdatingLocation()
    }
}
