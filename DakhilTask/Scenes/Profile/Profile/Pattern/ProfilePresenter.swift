//
//  ProfilePresenter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/29/21.
//

import Foundation

protocol ProfileView: AnyObject {

}


protocol ProfileCellView {
    
}

protocol ProfilePresenter {
    func viewDidLoad()
    func configure(cell: ProfileCellView, forRow row: Int)
}

class ProfilePresenterImplementation: ProfilePresenter {
    fileprivate weak var view: ProfileView?
    internal let router: ProfileRouter
    internal let interactor : ProfileInteractor

    
    init(view: ProfileView,router: ProfileRouter,interactor:ProfileInteractor) {
        self.view = view
        self.router = router
        self.interactor = interactor
       
    }

    
    func viewDidLoad() {
        
    }
    
    func configure(cell: ProfileCellView, forRow row: Int) {
       
    }

}
