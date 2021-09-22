//
//  TermsAndConditionsPresenter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/21/21.
//

import Foundation

protocol TermsAndConditionsView: AnyObject {
    func reloadData(model: TermsData)
}

protocol TermsAndConditionsPresenter {
    func viewDidLoad()
}

class TermsAndConditionsPresenterImplementation: TermsAndConditionsPresenter {
    fileprivate weak var view: TermsAndConditionsView?
    internal let router: TermsAndConditionsRouter
    internal let interactor : TermsAndConditionsInteractor

    
    init(view: TermsAndConditionsView,router: TermsAndConditionsRouter,interactor:TermsAndConditionsInteractor) {
        self.view = view
        self.router = router
        self.interactor = interactor
       
    }

    func viewDidLoad() {
        fetchData()
    }
    
    func fetchData() {
        interactor.getTermsAndConditions { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                guard let data = model.data else { return } 
                DispatchQueue.main.async {
                    self.view?.reloadData(model: data)
                }
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
