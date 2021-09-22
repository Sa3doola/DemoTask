//
//  TermsAndConditionsRouter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/21/21.
//

import UIKit


protocol TermsAndConditionsRouter {
    
}

class TermsAndConditionsRouterImplementation: TermsAndConditionsRouter {
    fileprivate weak var TermsAndConditionsViewController: TermsAndConditionsViewController?
    
    init(TermsAndConditionsViewController: TermsAndConditionsViewController) {
        self.TermsAndConditionsViewController = TermsAndConditionsViewController
    }
    
    
}
