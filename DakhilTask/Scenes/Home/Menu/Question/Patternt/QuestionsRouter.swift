//
//  QuestionsRouter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/20/21.
//

import UIKit


protocol QuestionsRouter {
    
}

class QuestionsRouterImplementation: QuestionsRouter {
    fileprivate weak var QuestionsViewController: QuestionsViewController?
    
    init(QuestionsViewController: QuestionsViewController) {
        self.QuestionsViewController = QuestionsViewController
    }
    
    
}
