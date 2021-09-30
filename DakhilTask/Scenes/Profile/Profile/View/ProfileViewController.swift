//
//  ProfileViewController.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/29/21.
//

import UIKit
import SDWebImage

final class ProfileViewController: UIViewController {
    
    
    // MARK: - Properties
    
    var configurator = ProfileConfiguratorImplementation()
    
    var presenter: ProfilePresenter?
    
    let pickerController = UIImagePickerController()
    
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
        pickerController.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: - IBActions
    
    @IBAction func editProfileImageWasTapped(_ sender: UIButton) {
        presenter?.pickImageProfile()
    }
    
    @IBAction func editUserInfromationWasTapped(_ sender: UIButton) {
        presenter?.goToEditProfile()
    }
    
    @IBAction func editPasswordWasTapped(_ sender: UIButton) {
        print("Edit Password")
    }
}

// MARK: - ProfileView

extension ProfileViewController: ProfileView {
    
    func configure(_ model: UserBaseInfo) {
        self.userNameLabel.text = model.name
        self.phoneLabel.text = model.phone
        self.cityNameLabel.text = model.cityName
        self.adressLabel.text = model.address?[0].address
        guard let image = UserDefaults.standard.loadImage() else { return }
        userProfileImage.sd_setImage(with: URL(string: image), completed: nil)
    }
    
    func showActionSheet() {
        
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose Your Photo", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action) in
            self.pickerController.sourceType = .camera
            self.present(self.pickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action) in
            self.pickerController.sourceType = .photoLibrary
            self.present(self.pickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
}

// MARK: - UIImagePickerControllerDelegate and UINavigationControllerDelegate

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.pickerController.dismiss(animated: true, completion: nil)
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }
        if let data = image.jpegData(compressionQuality: 0.5) {
            let timeStamp = NSDate().timeIntervalSince1970
            self.presenter?.uploadImage(image: data, fileName: "\(timeStamp).png")
        }
        self.userProfileImage.image = image
    }
}

