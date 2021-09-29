//
//  ProfileViewController.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/29/21.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    
    // MARK: - Properties
    
    var configurator = ProfileConfiguratorImplementation()
    
    var presenter: ProfilePresenter?
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var adressLabel: UILabel!
    
    // MARK: - UIViewController Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(ProfileViewController: self)
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - IBActions
    
    @IBAction func editProfileImageWasTapped(_ sender: UIButton) {
        print("Edit Profie Image")
    }
    
    @IBAction func editUserInfromationWasTapped(_ sender: UIButton) {
        print("Edit User Information")
    }
    
    @IBAction func editPasswordWasTapped(_ sender: UIButton) {
        print("Edit Password")
    }
}

// MARK: - ProfileView

extension ProfileViewController: ProfileView {}
