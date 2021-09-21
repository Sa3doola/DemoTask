//
//  SideMenuPresenter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/21/21.
//

import Foundation

protocol SideMenuView: AnyObject {
    func reloadData()
}

protocol SideMenuCellView {
    func configure(model: SideMenuModel)
}

protocol SideMenuPresenter {
    func numberOfRows() -> Int
    func configure(cell: SideMenuCellView, forRow row: Int)
    func didSelect(at row: Int)
}

class SideMenuPresenterImplementation: SideMenuPresenter {
    
    fileprivate weak var view: SideMenuView?
    internal let router: SideMenuRouter
    
    
    let models: [SideMenuModel] = [
        SideMenuModel(id: 0, viewColor: #colorLiteral(red: 0.4078431373, green: 0.9215686275, blue: 0.768627451, alpha: 1), image: "Language", name: "Language", discription: "Choose app language"),
        SideMenuModel(id: 1, viewColor: #colorLiteral(red: 0.537254902, green: 0.631372549, blue: 0.7411764706, alpha: 1), image: "AboutUs", name: "About App", discription: "Information about app"),
        SideMenuModel(id: 2, viewColor: #colorLiteral(red: 0.9333333333, green: 0.8549019608, blue: 0.6, alpha: 1), image: "Questions", name: "FAQs", discription: "Questions about app"),
        SideMenuModel(id: 3, viewColor: #colorLiteral(red: 0.4039215686, green: 0.7529411765, blue: 0.6156862745, alpha: 1), image: "Terms", name: "Terms and Conditions", discription: "Our Terms and Conditions"),
        SideMenuModel(id: 4, viewColor: #colorLiteral(red: 0.968627451, green: 0.7215686275, blue: 0.3882352941, alpha: 1), image: "ChatWhite", name: "Complaints and suggestions", discription: "Send your complaint or suggestion here"),
        SideMenuModel(id: 5, viewColor: #colorLiteral(red: 0.4039215686, green: 0.7882352941, blue: 0.1843137255, alpha: 1), image: "ContactUs", name: "Contact Us", discription: "To communicate with us"),
        SideMenuModel(id: 6, viewColor: #colorLiteral(red: 0.9333333333, green: 0.1725490196, blue: 0.1725490196, alpha: 1), image: "LogOut", name: "Log Out", discription: "Log Out from Account")
    ]
    
    init(view: SideMenuView, router: SideMenuRouter) {
        self.view = view
        self.router = router
    }
    
    func numberOfRows() -> Int {
        return models.count
    }
    
    func configure(cell: SideMenuCellView, forRow row: Int) {
        let data = models[row]
        cell.configure(model: data)
    }
    
    func didSelect(at row: Int) {
        let id = models[row].id
        
        switch id {
        case 0:
            print("\(id)")
        case 1:
            print("\(id)")
        case 2:
            print("\(id)")
        case 3:
            print("\(id)")
        case 4:
            print("\(id)")
        case 5:
            print("\(id)")
        case 6:
            print("\(id)")
        default:
            print("\(id)")
        }
    }
}
