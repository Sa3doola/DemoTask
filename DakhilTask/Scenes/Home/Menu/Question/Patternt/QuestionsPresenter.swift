//
//  QuestionsPresenter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/20/21.
//

import Foundation

protocol QuestionsView: AnyObject {
    func reloadData()
}


protocol QuestionsCellView {
    func congiureCell(model: Fq)
}

protocol QuestionsPresenter {
    func viewDidLoad()
    func numberOfRows() -> Int
    func configure(cell: QuestionsCellView, forRow row: Int)
}

class QuestionsPresenterImplementation: QuestionsPresenter {
    fileprivate weak var view: QuestionsView?
    internal let router: QuestionsRouter
    internal let interactor : QuestionsInteractor
    
    private var models: [Fq]?
    
    init(view: QuestionsView,router: QuestionsRouter,interactor:QuestionsInteractor) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    
    func viewDidLoad() {
        fetchData()
    }
    
    func fetchData() {
        interactor.getQuestions { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                self.models = model.data?.fqs
                self.view?.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func numberOfRows() -> Int {
        return models?.count ?? 0
    }
    
    func configure(cell: QuestionsCellView, forRow row: Int) {
        guard let data = models?[row] else { return }
        cell.congiureCell(model: data)
    }
    
}
