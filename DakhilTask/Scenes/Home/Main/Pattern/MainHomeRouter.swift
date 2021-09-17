//
//  MainHomeRouter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import UIKit


protocol MainHomeRouter {
    
}

class MainHomeRouterImplementation: MainHomeRouter {
    fileprivate weak var MainHomeViewController: MainHomeViewController?
    
    init(MainHomeViewController: MainHomeViewController) {
        self.MainHomeViewController = MainHomeViewController
    }
}
