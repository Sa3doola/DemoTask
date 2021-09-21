//
//  SideMenuConfigurator.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/21/21.
//

import Foundation

protocol SideMenuConfigurator {
    func configure(SideMenuViewController: SideMenuViewController)
}

class SideMenuConfiguratorImplementation {
    
    func configure(SideMenuViewController: SideMenuViewController) {
        
        let view = SideMenuViewController
        let router = SideMenuRouterImplementation(SideMenuViewController: view)
        
        let presenter = SideMenuPresenterImplementation(view: view, router: router)
        
        SideMenuViewController.presenter = presenter
    }
}
