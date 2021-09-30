//
//  ProfileRouter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/29/21.
//

import UIKit


protocol ProfileRouter {
    func goToEditProfile()
}

class ProfileRouterImplementation: ProfileRouter {
    
    
    let profile = Storyboard.profileStoryboard
    
    fileprivate weak var ProfileViewController: ProfileViewController?
    
    init(ProfileViewController: ProfileViewController) {
        self.ProfileViewController = ProfileViewController
    }
    
    func goToEditProfile() {
        let vc: EditProfileViewController = profile.instantiateViewController()
        self.ProfileViewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
