//
//  LoginPresenter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import Foundation

protocol LoginView: AnyObject {
    func showAlert(_ message: String)
}

protocol LoginPresenter {
    func goToSignUp()
    func validate(phone: String, password: String)
}

class LoginPresenterImplementation: LoginPresenter {
    
    fileprivate weak var view: LoginView?
    internal let router: LoginRouter
    internal let interactor : LoginInteractor
    
    
    init(view: LoginView,router: LoginRouter,interactor:LoginInteractor) {
        self.view = view
        self.router = router
        self.interactor = interactor
        
    }
    
    func validate(phone: String, password: String) {
        do {
            let phone = try ValidateService.validate(phone: phone)
            let password = try ValidateService.validate(password: password)
            self.loginRequest(phone: phone, password: password)
        } catch  {
            view?.showAlert(error.localizedDescription)
        }
    }
    
    func loginRequest(phone: String, password: String) {
        interactor.login(phone: phone, password: password, userType: "client",
                         deviceId: "123654123654", deviceType: "ios",
                         uuid: NSUUID().uuidString) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                print(model)
                do {
                    let resultModel = try ValidateService.validate(model: model)
                    print(resultModel)
                    let token = resultModel.data?.userBaseInfo?.token
                    UserDefaults.standard.saveToken(token: token)
                    self.router.goToHome()
                } catch {
                    self.view?.showAlert(error.localizedDescription)
                    if error.localizedDescription == "Need To Active" {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            self.router.goToActivation(phone: phone)
                        }
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    func goToSignUp() {
        router.goToSignUp()
    }
    
}
