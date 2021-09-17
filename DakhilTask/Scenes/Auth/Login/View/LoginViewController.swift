//
//  LoginViewController.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    var configurator = LoginConfiguratorImplementation()
    
    var presenter: LoginPresenter?
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var phoneNumberTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    
    // MARK: - UIViewController Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(LoginViewController: self)
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Helper Functions
    
    
    // MARK: - IBActions
    
    @IBAction func forgetPasswordWasTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func loginWasTapped(_ sender: UIButton) {
        presenter?.goToHome()
    }
    
    @IBAction func signupWasTapped(_ sender: UIButton) {
        presenter?.goToSignUp()
    }
}

extension LoginViewController: LoginView {}
