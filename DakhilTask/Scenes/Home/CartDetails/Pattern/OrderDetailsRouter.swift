//
//  OrderDetailsRouter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/18/21.
//

import UIKit


protocol OrderDetailsRouter {
  
}

class OrderDetailsRouterImplementation: OrderDetailsRouter {
    fileprivate weak var OrderDetailsViewController: OrderDetailsViewController?
    
    init(OrderDetailsViewController: OrderDetailsViewController) {
        self.OrderDetailsViewController = OrderDetailsViewController
    }
}
