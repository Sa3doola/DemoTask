//
//  AboutUsPresenter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/21/21.
//

import Foundation

protocol AboutUsView: AnyObject {
    func reloadData(_ model: AboutUsData)
}

protocol AboutUsPresenter {
    func viewDidLoad()
}

class AboutUsPresenterImplementation: AboutUsPresenter {
    fileprivate weak var view: AboutUsView?
    internal let router: AboutUsRouter
    internal let interactor : AboutUsInteractor
    
    
    init(view: AboutUsView,router: AboutUsRouter,interactor:AboutUsInteractor) {
        self.view = view
        self.router = router
        self.interactor = interactor
        
    }
    
    func viewDidLoad() {
        fetchData()
    }
    
    func fetchData() {
        interactor.getAboutUs { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                guard let data = model.data else { return }
                DispatchQueue.main.async {
                    self.view?.reloadData(data)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
