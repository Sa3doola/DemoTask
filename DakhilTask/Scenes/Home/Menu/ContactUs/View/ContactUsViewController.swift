//
//  ContactUsViewController.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/21/21.
//

import UIKit

final class ContactUsViewController: UIViewController {
    
    var configurator = ContactUsConfiguratorImplementation()
    
    var presenter: ContactUsPresenter?
    
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var whatsAppLabel: UILabel!
    // MARK: - UIViewController Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(ContactUsViewController: self)
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        tabBarController?.tabBar.isHidden = true
    }
    
    @IBAction func linkedInWasTapped(_ sender: UIButton) {
    }
    @IBAction func twitterWasTapped(_ sender: UIButton) {
    }
    @IBAction func facbookWasTapped(_ sender: UIButton) {
    }
    @IBAction func instagramWasTapped(_ sender: UIButton) {
    }
    
}



extension ContactUsViewController: ContactUsView {
    func reloadData(_ model: ContactUs) {
        self.phoneLabel.text = model.mobile
        self.whatsAppLabel.text = model.whatsApp
    }
}
