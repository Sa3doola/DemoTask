//
//  CitiesCell.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/28/21.
//

import UIKit

protocol FilterCellView {
    func configure(model: CitiesModel)
}

class CitiesCell: UICollectionViewCell, FilterCellView {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var citiyName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureView()
    }
    
    override var isSelected: Bool {
            didSet {
                if isSelected { // Selected cell
                    self.containerView.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.5725490196, blue: 0.1450980392, alpha: 1)
                    self.citiyName.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                    self.citiyName.clipsToBounds = true
                    self.backgroundView?.clipsToBounds = true
                } else { // Normal cell
                    self.containerView.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
                    self.citiyName.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
               }
            }
        }
    
    private func configureView() {
        containerView.layer.borderWidth = 1.2
        containerView.layer.borderColor = #colorLiteral(red: 0.431372549, green: 0.4156862745, blue: 0.4156862745, alpha: 1)
    }
    
    func configure(model: CitiesModel) {
        self.citiyName.text = model.name
    }
    
    
}
