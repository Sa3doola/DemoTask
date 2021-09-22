//
//  TermsAndConditionsViewController.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/21/21.
//

import UIKit

final class TermsAndConditionsViewController: UIViewController {
    
    var configurator = TermsAndConditionsConfiguratorImplementation()
    
    var presenter: TermsAndConditionsPresenter?
    
    @IBOutlet weak var textView: UITextView!
    // MARK: - UIViewController Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(TermsAndConditionsViewController: self)
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        tabBarController?.tabBar.isHidden = true
    }
}



extension TermsAndConditionsViewController: TermsAndConditionsView {
    func reloadData(model: TermsData) {
        self.textView.text = model.termsConditions
    }
}
