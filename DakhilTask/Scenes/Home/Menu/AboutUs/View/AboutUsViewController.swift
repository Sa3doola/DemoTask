//
//  AboutUsViewController.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/21/21.
//

import UIKit

final class AboutUsViewController: UIViewController {
    
    var configurator = AboutUsConfiguratorImplementation()
    
    var presenter: AboutUsPresenter?
    
    @IBOutlet weak var textView: UITextView!
    // MARK: - UIViewController Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(AboutUsViewController: self)
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        tabBarController?.tabBar.isHidden = true
    }
    
}



extension AboutUsViewController: AboutUsView {
    func reloadData(_ model: AboutUsData) {
        self.textView.text = model.aboutUs
    }
}
