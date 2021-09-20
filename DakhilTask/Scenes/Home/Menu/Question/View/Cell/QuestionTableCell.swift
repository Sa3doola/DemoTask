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
    
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    private let containerView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()
    
    private let questionView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    private let answerLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return label
    }()
    
    private let answerView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var data: Fq? {
        didSet {
            guard let data = data else { return }
            self.questionLabel.text = data.question
            self.answerLabel.text = data.answer
        }
    }
    
    private func configureUI() {
        selectionStyle = .none
        contentView.addSubview(questionLabel)
        contentView.addSubview(answerLabel)
        
        questionLabel.anchor(top: contentView.topAnchor,
                            leading: contentView.leadingAnchor,
                            bottom: answerLabel.topAnchor,
                            trailing: contentView.trailingAnchor,
                            padding: .init(top: 10, left: 10, bottom: 10, right: 10))
        
        answerLabel.anchor(top: self.questionLabel.bottomAnchor,
                           leading: contentView.leadingAnchor,
                           bottom: contentView.bottomAnchor,
                           trailing: contentView.trailingAnchor,
                           padding: .init(top: 10, left: 10, bottom: 10, right: 10),
                           size: .init(width: self.contentView.width,
                                       height: 30))
    }
    
    func congiureCell(model: Fq) {
        self.data = model
    }
    
    var isAnswerLabelIsHidden: Bool {
        return answerLabel.isHidden
    }
    
    func showAnswerLabel() {
        answerLabel.isHidden = false
    }
    
    func hideAnswerLabel() {
        answerLabel.isHidden = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if isAnswerLabelIsHidden, selected {
            showAnswerLabel()
        } else {
            hideAnswerLabel()
        }
    }
}
