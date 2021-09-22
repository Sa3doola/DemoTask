//
//  Extentions.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import UIKit

// MARK: - Storyboard

enum Storyboard: String {
    case auth = "Main"
    case tabBar = "TabBar"
    case home = "Home"
    
    static var authStoryboard: UIStoryboard {
        return UIStoryboard(name: Storyboard.auth.rawValue, bundle: nil)
    }
    
    static var tabBarStoryboard: UIStoryboard {
        return UIStoryboard(name: Storyboard.tabBar.rawValue, bundle: nil)
    }
    
    static var homeSrotyboard: UIStoryboard {
        return UIStoryboard(name: Storyboard.home.rawValue, bundle: nil)
    }
}

extension UIStoryboard {
    func instantiateViewController<T>(withIdentifier identifier: String = String(describing: T.self)) -> T {
        return instantiateViewController(withIdentifier: identifier) as! T
    }
}

// MARK: - UserDefaults

extension UserDefaults {
    
    // MARK: - Save
    
    func saveToken(token: String?) {
        UserDefaults.standard.set(token, forKey: "userToken")
    }
    
    func saveUUID(uuid: String?) {
        UserDefaults.standard.set(uuid, forKey: "uuid")
    }
    
    func saveAddress(address: String?) {
        UserDefaults.standard.set(address, forKey: "address")
    }
    
    // MARK: - Load
    
    func loadToken() -> String? {
        let token = UserDefaults.standard.value(forKey: "userToken")
        return token as? String 
    }
    
    func loadUUID() -> String? {
        let uuid = UserDefaults.standard.value(forKey: "uuid")
        return uuid as? String
    }
    
    func loadAddress() -> String? {
        let address = UserDefaults.standard.value(forKey: "address")
        return address as? String
    }
    
}

