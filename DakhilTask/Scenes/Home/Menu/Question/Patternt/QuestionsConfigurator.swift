//
//  QuestionsConfigurator.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/20/21.
//

import Foundation


protocol QuestionsConfigurator {
    func configure(QuestionsViewController:QuestionsViewController)
}


class QuestionsConfiguratorImplementation {
    
    func configure(QuestionsViewController:QuestionsViewController) {
        let view = QuestionsViewController
        let router = QuestionsRouterImplementation(QuestionsViewController: view)
        
        let interactor = QuestionsInteractor()
        let presenter = QuestionsPresenterImplementation(view: view, router: router,interactor:interactor)
        
        
        QuestionsViewController.presenter = presenter
    }
    
}
