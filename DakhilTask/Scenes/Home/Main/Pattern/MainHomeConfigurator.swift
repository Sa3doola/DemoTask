//
//  MainHomeConfigurator.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import Foundation


protocol MainHomeConfigurator {
    func configure(MainHomeViewController:MainHomeViewController)
}


class MainHomeConfiguratorImplementation {
    
    func configure(MainHomeViewController:MainHomeViewController) {
        let view = MainHomeViewController
        let router = MainHomeRouterImplementation(MainHomeViewController: view)
        
        let interactor = MainHomeInteractor()
        let presenter = MainHomePresenterImplementation(view: view, router: router,interactor:interactor)
        
        
        MainHomeViewController.presenter = presenter
    }
    
}
