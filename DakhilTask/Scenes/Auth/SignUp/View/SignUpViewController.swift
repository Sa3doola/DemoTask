//
//  SignUpViewController.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import UIKit

final class SignUpViewController: UIViewController {
    
    // MARK: - Properties
    
    var configurator = SignUpConfiguratorImplementation()
    
    var presenter: SignUpPresenter?
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var userNameTxtField: UITextField!
    @IBOutlet weak var phoneNumberTxtField: UITextField!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var confirmPasswordTxtField: UITextField!
    
    // MARK: - UIViewController Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(SignUpViewController: self)
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Helper Functions
    
    // MARK: - IBActions
    
    @IBAction func cityPickerWasTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func locationWasTapped(_ sender: UIButton) {
        presenter?.goToMap()
    }
    
    @IBAction func signupWasTapped(_ sender: UIButton) {
        presenter?.goToActivation()
    }
    
    @IBAction func loginWasTapped(_ sender: UIButton) {
        presenter?.backToLogin()
    }
    
}

extension SignUpViewController: SignUpView {}
