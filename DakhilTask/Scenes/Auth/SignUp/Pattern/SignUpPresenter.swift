//
//  SignUpPresenter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import Foundation

protocol SignUpView: AnyObject {
    func showPickerView()
    func showAlert(_ message: String)
}

protocol SignUpPresenter {
    func backToLogin()
    func goToMap()
    func setCities()
    func numberOfCities() -> Int
    func citiesForPicker(row: Int) -> (String, Int)
    func validate(name: String, phone: String, cityId: Int, address: String,
                  lat: Double, lng: Double, password: String, confPass: String)
    func viewDidLoad()
}

class SignUpPresenterImplementation: SignUpPresenter {
    
    
    fileprivate weak var view: SignUpView?
    internal let router: SignUpRouter
    internal let interactor : SignUpInteractor
    
    private var cities: [City]?
    
    init(view: SignUpView,router: SignUpRouter,interactor:SignUpInteractor) {
        self.view = view
        self.router = router
        self.interactor = interactor
        
    }
    
    func backToLogin() {
        router.backToLogin()
    }
    
    func goToMap() {
        router.goToMap()
    }
    
    func setCities() {
        self.view?.showPickerView()
    }
    
    func numberOfCities() -> Int {
        return self.cities?.count ?? 0
    }
    
    func citiesForPicker(row: Int) -> (String, Int) {
        guard let city = cities?[row] else { return ("", 0) }
        return (city.name ?? "", city.id ?? 0)
    }
    
    func validate(name: String, phone: String, cityId: Int, address: String, lat: Double, lng: Double, password: String, confPass: String) {
        do {
            let validateName = try ValidateService.validate(name: name)
            let validatePhone = try ValidateService.validate(phone: phone)
            let validateCity = try ValidateService.validate(cityId: cityId)
            let validateAddress = try ValidateService.validate(adress: address)
            let validatePassword = try ValidateService.validate(password: password)
            let validateConfrimPassord = try ValidateService.validate(confirmPassword: confPass)
            let validateConfimation = try ValidateService.validate(password: password, confirmPassword: confPass)
            if validateConfimation {
                self.signUpRequest(name: validateName, phone: validatePhone, cityId: validateCity,
                                   address: validateAddress, lat: lat, lng: lng, password: validatePassword,
                                   confrimPass: validateConfrimPassord)
            }
        } catch  {
            view?.showAlert(error.localizedDescription)
        }
    }
    
    func viewDidLoad() {
        getCities()
    }
    
    func getCities() {
        interactor.getCities { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                self.cities = model.data?.cities
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func signUpRequest(name: String, phone: String, cityId: Int, address: String,
                       lat: Double, lng: Double, password: String, confrimPass: String) {
        interactor.signUp(userName: name, phone: phone, cityId: cityId, lat: lat, lng: lng,                address: address, password: password, confirmPass: confrimPass,
                          addressTypeID: "1") { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                do {
                    let resultModel = try ValidateService.validate(model: model)
                    print(resultModel)
                    self.router.goToActivation(phone: phone)
                } catch {
                    self.view?.showAlert(model.msg!)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
