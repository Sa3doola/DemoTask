//
//  EditProfileRouter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/30/21.
//

import UIKit


protocol EditProfileRouter {
  
}

class EditProfileRouterImplementation: EditProfileRouter {
    fileprivate weak var EditProfileViewController: EditProfileViewController?
    
    init(EditProfileViewController: EditProfileViewController) {
        self.EditProfileViewController = EditProfileViewController
    }
    
    
}
