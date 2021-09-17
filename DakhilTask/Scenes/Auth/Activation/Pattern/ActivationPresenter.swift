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
    func viewDidLoad()
    func goToLogin()
}

class ActivationPresenterImplementation: ActivationPresenter {
    fileprivate weak var view: ActivationView?
    internal let router: ActivationRouter
    internal let interactor : ActivationInteractor

    
    init(view: ActivationView,router: ActivationRouter,interactor:ActivationInteractor) {
        self.view = view
        self.router = router
        self.interactor = interactor
       
    }

    func viewDidLoad() {
        
    }
    
    func goToLogin() {
        router.goToLogin()
    }
}
