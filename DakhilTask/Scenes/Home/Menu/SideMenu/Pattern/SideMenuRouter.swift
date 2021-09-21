//
//  SideMenuRouter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/21/21.
//

import UIKit

protocol SideMenuRouter {
    
}

class SideMenuRouterImplementation: SideMenuRouter {
    
    fileprivate weak var SideMenuViewController: SideMenuViewController?
    
    init(SideMenuViewController: SideMenuViewController) {
        self.SideMenuViewController = SideMenuViewController
    }
}
