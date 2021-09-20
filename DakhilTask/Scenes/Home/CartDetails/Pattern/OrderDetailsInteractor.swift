//
//  OrderDetailsInteractor.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/18/21.
//

import Alamofire

class OrderDetailsInteractor {
    
    func getOrderDetails(orderId: Int, completion: @escaping completion<OrderDetails>) {
        AF.request(APIRouter.orderDetails(orderID: orderId)).responseDecodable { (response) in
            completion(response.result)
        }
    }
    
    func updateOrderAmount(orderServiceId: Int, amount: Int, comppletion: @escaping completion<UpdateOrder>) {
        AF.request(APIRouter.updateOrderAmount(orderServiceId: orderServiceId, amount: amount)).responseDecodable { (response) in
            comppletion(response.result)
        }
    }
}
