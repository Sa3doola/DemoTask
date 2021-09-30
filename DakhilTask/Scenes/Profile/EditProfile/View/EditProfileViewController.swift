//
//  EditProfileViewController.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/30/21.
//

import UIKit

final class EditProfileViewController: UIViewController {
    
    // MARK: - Properties
    
    var configurator = EditProfileConfiguratorImplementation()
    
    var presenter: EditProfilePresenter?
    
    var cityId: Int? = 0
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var userNameTxtField: UITextField!
    @IBOutlet weak var phoneTxtField: UITextField!
    @IBOutlet weak var cityNameLabel: UILabel!
    
    // MARK: - UIViewController Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(EditProfileViewController: self)
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        tabBarController?.tabBar.isHidden = true
    }
    
    // MARK: - IBActions
    
    @IBAction func pickerCityWasTapped(_ sender: UIButton) {
        presenter?.setCities()
    }
    
    @IBAction func updateProfileWasTapped(_ sender: UIButton) {
        
    }
}

// MARK: - EditProfileView

extension EditProfileViewController: EditProfileView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    func showAlert(_ message: String) {
        let alert = UIAlertController(title: "Please Try Again",
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showPickerView() {
        let vc = SignUpViewController()
        vc.preferredContentSize = CGSize(width: 250, height: 250)
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0,
                                                    width: 250,
                                                    height: 250))
        pickerView.delegate = self
        pickerView.dataSource = self
        vc.view.addSubview(pickerView)
        let alert = UIAlertController(title: "Please Select City", message: "", preferredStyle: .alert)
        alert.setValue(vc, forKey: "contentViewController")
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - UIPickerViewDelegate and DataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return presenter?.numberOfCities ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let city = presenter?.citiesForPicker(row: row)
        return  city?.0 ?? ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let city = presenter?.citiesForPicker(row: row)
        cityNameLabel.text = city?.0
        cityId = city?.1 ?? 0
    }
}
