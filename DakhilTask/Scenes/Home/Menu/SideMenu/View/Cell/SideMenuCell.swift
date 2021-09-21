//
//  SideMenuCell.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/21/21.
//

import UIKit

class SideMenuCell: UITableViewCell, SideMenuCellView {

    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var discriptionLabel: UILabel!
    
    
    func configure(model: SideMenuModel) {
        
        logoView.backgroundColor = model.viewColor
        logoImage.image = UIImage(named: model.image)
        nameLabel.text = model.name
        discriptionLabel.text = model.discription
    }
    
}
