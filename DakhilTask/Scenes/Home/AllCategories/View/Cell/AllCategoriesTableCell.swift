//
//  AllCategoriesTableCell.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/26/21.
//

import UIKit
import SDWebImage

protocol AllCategoriesCellView {
 func configure()
}

class AllCategoriesTableCell: UITableViewCell, AllCategoriesCellView {


    @IBOutlet weak var catImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure() {
        
    }
    
}
