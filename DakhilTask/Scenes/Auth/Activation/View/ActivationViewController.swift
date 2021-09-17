//
//  ActivationViewController.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import UIKit

final class ActivationViewController: UIViewController {
    
    // MARK: - Properties
    
    var configurator = ActivationConfiguratorImplementation()
    
    var presenter: ActivationPresenter?
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var OPTTxtField1: UITextField!
    @IBOutlet weak var OPTTxtField2: UITextField!
    @IBOutlet weak var OPTTxtField3: UITextField!
    @IBOutlet weak var OPTTxtField4: UITextField!
    
    // MARK: - UIViewController Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(ActivationViewController: self)
        presenter?.viewDidLoad()
    }
    
    // MARK: - Helper Functions
    
    // MARK: - IBActions
    
    @IBAction func resendCodeWasTapped(_ sender: UIButton) {
        print("Resend Code")
    }
    
    @IBAction func submitWasTapped(_ sender: UIButton) {
        presenter?.goToLogin()
    }
    
}

extension ActivationViewController: ActivationView {}
