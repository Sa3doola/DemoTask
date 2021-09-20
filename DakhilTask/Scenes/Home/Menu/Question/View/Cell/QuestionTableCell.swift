//
//  QuestionTableCell.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/20/21.
//

import UIKit

class QuestionTableCell: UITableViewCell, QuestionsCellView {
    
    // MARK: - Properties
    
    static let id = String(describing: QuestionTableCell.self)
    
    var data: Fq? {
        didSet {
            guard let data = data else { return }
            self.questionlabel.text = data.question
            self.answerLabel.text = data.answer
        }
    }
    
    private let questionlabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    
    private let answerLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = #colorLiteral(red: 0.4, green: 0.4039215686, blue: 0.4039215686, alpha: 1)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - LifeCycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        contentView.addSubview(questionlabel)
        contentView.addSubview(answerLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    // MARK: - Helper Functions
    
    func congiureCell(model: Fq) {
        self.data = model
    }

}
