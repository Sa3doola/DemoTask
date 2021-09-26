//
//  Extentions.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import UIKit
import CoreLocation

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
    
    func saveLocation(location: CLLocation) {
        if let encodedLocation = try? NSKeyedArchiver.archivedData(withRootObject: location, requiringSecureCoding: false) {
            UserDefaults.standard.set(encodedLocation, forKey: "SavedLocation")
        }
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
    
    func loadLocation() -> CLLocation {
        var location: CLLocation!
        if let loadedLocation = UserDefaults.standard.data(forKey: "SavedLocation"),
           let decodedLocation = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(loadedLocation) as? CLLocation {
            location = decodedLocation
        }
        return location
    }
}

// MARK: - UITableView

extension UITableView {
    
    func register<Cell: UITableViewCell>(cell: Cell.Type) {
        let nibName = String(describing: Cell.self)
        self.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
    }
    
    func dequeueCell<Cell: UITableViewCell>(indexPath: IndexPath) -> Cell {
        let identifier = String(describing: Cell.self)
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? Cell else {
            fatalError("Error with dequeue cell \(Cell.self)")
        }
        return cell
    }
}

// MARK: - UICollectionView

extension UICollectionView {
    
    func register<Cell: UICollectionViewCell>(cell: Cell.Type) {
        let nibName = String(describing: Cell.self)
        self.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
    }
    
    func dequeueCell<Cell: UICollectionViewCell>(indexPath: IndexPath) -> Cell {
        let identifier = String(describing: Cell.self)
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? Cell else { fatalError("Error With dequeue Cell \(Cell.self)")
        }
        return cell
    }
}
