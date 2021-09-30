//
//  ProfilePresenter.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/29/21.
//

import Foundation

protocol ProfileView: AnyObject {
    func configure(_ model: UserBaseInfo)
    func showActionSheet()
}

protocol ProfilePresenter {
    func viewDidLoad()
    
    // View
    func pickImageProfile()
    
    // Edit
    func uploadImage(image: Data, fileName: String)
    
    //Router
    func goToEditProfile()
}

class ProfilePresenterImplementation: ProfilePresenter {
    
    fileprivate weak var view: ProfileView?
    internal let router: ProfileRouter
    internal let interactor : ProfileInteractor

    private var model: UserBaseInfo?
    
    init(view: ProfileView,router: ProfileRouter,interactor:ProfileInteractor) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        fetchData()
    }
    
    func fetchData() {
        interactor.getProfileData { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                self.model = model.data?.userBaseInfo
                DispatchQueue.main.async {
                    self.configureData(data: model.data?.userBaseInfo)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func configureData(data: UserBaseInfo?) {
        guard let dataProfiel = data else { return }
        self.view?.configure(dataProfiel)
    }
    
    func pickImageProfile() {
        self.view?.showActionSheet()
    }
    
    func uploadImage(image: Data, fileName: String) {
        guard let name = model?.name else { return }
        guard let phone = model?.phone else { return }
        guard let id = model?.cityID else { return }
        guard let uuid = model?.uuid else { return }
        interactor.uploadImage(name: name, phone: phone, cityID: id, uuid: uuid, image: image, fileName: fileName) { (result) in
            switch result {
            case .success(let model):
                guard let image = model.data?.userBaseInfo?.image else { return }
                UserDefaults.standard.saveImage(image: image)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Router

    func goToEditProfile() {
        router.goToEditProfile()
    }
}
