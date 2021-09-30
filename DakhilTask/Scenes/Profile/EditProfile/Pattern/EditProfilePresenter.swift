//
//  EditProfilePresenter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/30/21.
//

import Foundation

protocol EditProfileView: AnyObject {
    func showAlert(_ message: String)
    func showPickerView()
}

protocol EditProfilePresenter {
    func viewDidLoad()
    var numberOfCities: Int { get }
    func citiesForPicker(row: Int) -> (String, Int)
    func setCities()
}

class EditProfilePresenterImplementation: EditProfilePresenter {
    
    fileprivate weak var view: EditProfileView?
    internal let router: EditProfileRouter
    internal let interactor : EditProfileInteractor

    private var cities: [City]?
    
    init(view: EditProfileView,router: EditProfileRouter,interactor:EditProfileInteractor) {
        self.view = view
        self.router = router
        self.interactor = interactor
       
    }
    
    func viewDidLoad() {
        getCities()
    }
    
    func setCities() {
        self.view?.showPickerView()
    }
    
    var numberOfCities: Int {
        return self.cities?.count ?? 0
    }
    
    func citiesForPicker(row: Int) -> (String, Int) {
        guard let city = cities?[row] else { return ("", 0) }
        return (city.name ?? "", city.id ?? 0)
    }
    
    func getCities() {
        interactor.getCities { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                self.cities = model.data?.cities
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}
