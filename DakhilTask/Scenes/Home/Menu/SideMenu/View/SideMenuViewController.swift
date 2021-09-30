//
//  SideMenuViewController.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/21/21.
//

import UIKit
import SDWebImage

class SideMenuViewController: UIViewController {
    
    // MARK: - Properties
    
    var configurator = SideMenuConfiguratorImplementation()
    
    var presenter: SideMenuPresenter?
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var menuTableView: UITableView!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(SideMenuViewController: self)
        menuTableView.register(cell: SideMenuCell.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        configureImage()
    }
    
    func configureImage() {
        guard let image = UserDefaults.standard.loadImage() else { return }
        userImageView.sd_setImage(with: URL(string: image), completed: nil)
    }
}

// MARK: - UITableViewDelegate and DataSource

extension SideMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueCell(indexPath: indexPath) as SideMenuCell
        presenter?.configure(cell: cell, forRow: indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.didSelect(at: indexPath.row)
    }
}

extension SideMenuViewController: SideMenuView {
    func reloadData() {
        self.menuTableView.reloadData()
    }
    
    func showAlertView(_ message: String) {
        let alert = UIAlertController(title: "logOut", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { (_) in
            self.presenter?.logOut()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
}


