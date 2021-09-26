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
    
    var selectedIndex: IndexPath = IndexPath(row: 0, section: 0)
    
    @IBOutlet weak var questionTableView: UITableView!
    
    // MARK: - UIViewController Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configurator.configure(QuestionsViewController: self)
        presenter?.viewDidLoad()
        configureTable()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.isHidden = false
    }
    // MARK: - Helper Functions
    
    func configureTable() {
        questionTableView.register(cell: QuestionCell.self)
    }
}

// MARK: - UITableViewDelegate and DataSource

extension QuestionsViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRows() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(indexPath: indexPath) as QuestionCell
        presenter?.configure(cell: cell, forRow: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath
        UIView.animate(withDuration: 0.3) {
            self.questionTableView.performBatchUpdates(nil)
        }
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if selectedIndex == indexPath { return 90 }
//        return 70
//    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = self.questionTableView.cellForRow(at: indexPath) as? QuestionCell {
            cell.hideAnswer()
        }
    }
}

// MARK: - QuestionsView

extension QuestionsViewController: QuestionsView {
    func reloadData() {
        questionTableView.reloadData()
    }
}
