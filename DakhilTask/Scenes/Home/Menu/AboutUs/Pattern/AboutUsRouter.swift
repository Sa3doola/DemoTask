//
//  AboutUsRouter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/21/21.
//

import UIKit


protocol AboutUsRouter {
    
}

class AboutUsRouterImplementation: AboutUsRouter {
    fileprivate weak var AboutUsViewController: AboutUsViewController?
    
    init(AboutUsViewController: AboutUsViewController) {
        self.AboutUsViewController = AboutUsViewController
    }
}
