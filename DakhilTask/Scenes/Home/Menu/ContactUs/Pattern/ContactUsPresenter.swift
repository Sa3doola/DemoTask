//
//  ContactUsPresenter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/21/21.
//

import Foundation

protocol ContactUsView: AnyObject {
    func reloadData(_ model: ContactUs)
}

protocol ContactUsPresenter {
    func viewDidLoad()
}

class ContactUsPresenterImplementation: ContactUsPresenter {
    fileprivate weak var view: ContactUsView?
    internal let router: ContactUsRouter
    internal let interactor : ContactUsInteractor

    
    init(view: ContactUsView,router: ContactUsRouter,interactor:ContactUsInteractor) {
        self.view = view
        self.router = router
        self.interactor = interactor
       
    }

    
    func viewDidLoad() {
        fetchData()
    }
    
    func fetchData() {
        interactor.getContactUs { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                guard let data = model.data?.contactUs else { return }
                DispatchQueue.main.async {
                    self.view?.reloadData(data)
                }
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
