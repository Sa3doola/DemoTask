//
//  ActivationPresenter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import Foundation

protocol ActivationView: AnyObject {

}

protocol ActivationPresenter {
    func activate(code: String)
    func goToLogin()
}

class ActivationPresenterImplementation: ActivationPresenter {
    fileprivate weak var view: ActivationView?
    internal let router: ActivationRouter
    internal let interactor : ActivationInteractor
    fileprivate let phone: String
    
    init(view: ActivationView,router: ActivationRouter,interactor:ActivationInteractor, phone: String) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.phone = phone
    }

    func activate(code: String) {
        
    }
    
    func goToLogin() {
        router.goToLogin()
    }
}
