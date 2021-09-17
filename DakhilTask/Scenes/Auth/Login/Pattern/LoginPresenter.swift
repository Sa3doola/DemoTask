//
//  LoginPresenter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import Foundation

protocol LoginView: AnyObject {
    
}

protocol LoginPresenter {
    func viewDidLoad()
    func goToSignUp()
    func goToHome()
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
    
    func viewDidLoad() {
        
    }
    
    func goToSignUp() {
        router.goToSignUp()
    }
    
    func goToHome() {
        router.goToHome()
    }
}
