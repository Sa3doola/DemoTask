//
//  QuestionCell.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/22/21.
//

import UIKit

class QuestionCell: UITableViewCell, QuestionsCellView {
    
    @IBOutlet weak var containerView: UIStackView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var btnImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        containerView.layer.borderColor = #colorLiteral(red: 0.9529411765, green: 0.5725490196, blue: 0.1450980392, alpha: 1)
        containerView.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if isAnswerLabelHidder, selected {
            showAnswer()
        } else {
            hideAnswer()
        }
    }
    
    func congiureCell(model: Fq) {
        questionLabel.text = model.question
        answerLabel.text = model.answer
    }
    
    var isAnswerLabelHidder: Bool {
        return answerLabel.isHidden
    }
    
    func showAnswer() {
        answerLabel.isHidden = false
        btnImage.image = #imageLiteral(resourceName: "Up")
    }
    
    func hideAnswer() {
        answerLabel.isHidden = true
        btnImage.image = #imageLiteral(resourceName: "Down")
    }
    
}
