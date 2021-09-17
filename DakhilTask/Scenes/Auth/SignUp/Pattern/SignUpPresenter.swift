//
//  SignUpPresenter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import Foundation

protocol SignUpView: AnyObject {
    
}


protocol SignUpPresenter {
    func viewDidLoad()
    func goToActivation()
    func backToLogin()
    func goToMap()
}

class SignUpPresenterImplementation: SignUpPresenter {
    fileprivate weak var view: SignUpView?
    internal let router: SignUpRouter
    internal let interactor : SignUpInteractor
    
    
    init(view: SignUpView,router: SignUpRouter,interactor:SignUpInteractor) {
        self.view = view
        self.router = router
        self.interactor = interactor
        
    }
    
    func viewDidLoad() {
        
    }
    
    func goToActivation() {
        router.goToActivation()
    }
    
    func backToLogin() {
        router.backToLogin()
    }
    
    func goToMap() {
        router.goToMap()
    }
}
