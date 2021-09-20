//
//  QuestionsViewController.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/20/21.
//

import UIKit

final class QuestionsViewController: UIViewController {
    
    // MARK: - Properties
    
    var configurator = QuestionsConfiguratorImplementation()
    
    var presenter: QuestionsPresenter?
    
    private let questionTableView: UITableView = {
        let tabelView = UITableView()
        tabelView.backgroundColor = .white
        return tabelView
    }()
    
    // MARK: - UIViewController Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configurator.configure(QuestionsViewController: self)
        presenter?.viewDidLoad()
        configureTable()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        questionTableView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                                 leading: view.leadingAnchor,
                                 bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                 trailing: view.trailingAnchor,
                                 padding: .init(top: 10, left: 10, bottom: 20, right: 10),
                                 size: .init(width: view.width - 20,
                                             height: view.height - 20))
    }
    
    // MARK: - Helper Functions
    
    func configureTable() {
        view.addSubview(questionTableView)
        questionTableView.register(QuestionTableCell.self,
                                   forCellReuseIdentifier: QuestionTableCell.id)
        questionTableView.delegate = self
        questionTableView.dataSource = self
    }
    
}

// MARK: - UITableViewDelegate and DataSource

extension QuestionsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: QuestionTableCell.id, for: indexPath) as? QuestionTableCell else { return UITableViewCell() }
        presenter?.configure(cell: cell, forRow: indexPath.row)
        return cell
    }
}

extension QuestionsViewController: QuestionsView {
    func reloadData() {
        self.questionTableView.reloadData()
    }
}
