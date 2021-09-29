//
//  ProfileRouter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/29/21.
//

import UIKit


protocol ProfileRouter {
  
}

class ProfileRouterImplementation: ProfileRouter {
    fileprivate weak var ProfileViewController: ProfileViewController?
    
    init(ProfileViewController: ProfileViewController) {
        self.ProfileViewController = ProfileViewController
    }
    
    
}
