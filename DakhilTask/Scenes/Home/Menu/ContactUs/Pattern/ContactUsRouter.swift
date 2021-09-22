//
//  ContactUsRouter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/21/21.
//

import UIKit


protocol ContactUsRouter {
  
}

class ContactUsRouterImplementation: ContactUsRouter {
    fileprivate weak var ContactUsViewController: ContactUsViewController?
    
    init(ContactUsViewController: ContactUsViewController) {
        self.ContactUsViewController = ContactUsViewController
    }
    
    
}
