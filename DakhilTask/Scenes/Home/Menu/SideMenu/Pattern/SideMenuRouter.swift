//
//  SideMenuRouter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/21/21.
//

import UIKit

protocol SideMenuRouter {
    func goToLogin()
    func goToQuestion()
    func goToAboutUs()
    func goToContactus()
    func goToTerms()
}

class SideMenuRouterImplementation: SideMenuRouter {
    
    fileprivate weak var SideMenuViewController: SideMenuViewController?
    
    let navgationManager = NavigationManager.shared
    
    let storyboard = Storyboard.homeSrotyboard
    
    init(SideMenuViewController: SideMenuViewController) {
        self.SideMenuViewController = SideMenuViewController
    }
    
    func goToLogin() {
        navgationManager.show(screen: .auth, inController: self.SideMenuViewController!)
    }
    
    func goToQuestion() {
        let vc: QuestionsViewController = storyboard.instantiateViewController()
        self.SideMenuViewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToAboutUs() {
        let vc: AboutUsViewController = storyboard.instantiateViewController()
        self.SideMenuViewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToContactus() {
        let vc: ContactUsViewController = storyboard.instantiateViewController()
        self.SideMenuViewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToTerms() {
        let vc: TermsAndConditionsViewController = storyboard.instantiateViewController()
        self.SideMenuViewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
