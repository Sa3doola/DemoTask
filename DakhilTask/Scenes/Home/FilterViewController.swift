//
//  FilterViewController.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/28/21.
//

import UIKit

final class FilterViewController: UIViewController {
    
    // MARK: - Properties
    
    var configurator: FilterConfiguratorImplementation!
    
    var presenter: FilterPresenter?
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var citiesCollectionView: UICollectionView!
    @IBOutlet weak var heighBtn: UIButton!
    @IBOutlet weak var lowBtn: UIButton!
    
    // MARK: - UIViewController Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(FilterViewController: self)
        presenter?.viewDidLoad()
        configureCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    private func configureCollectionView() {
        citiesCollectionView.register(cell: CitiesCell.self)
    }
    
    // MARK: - Helper Functions
    
    private func setRateOptionsSelection(_ isOptionSelected: Bool) {
        if isOptionSelected {
            self.heighBtn.isSelected = true
            self.lowBtn.isSelected = false
            presenter?.getRate(rate: "heigh")
        } else {
            self.heighBtn.isSelected = false
            self.lowBtn.isSelected = true
            presenter?.getRate(rate: "low")
        }
    }
    
    // MARK: - IBActions
    
    @IBAction func confirmFilterWasTapped(_ sender: UIButton) {
        presenter?.addFilter()
    }
    
    @IBAction func highRateWasTapped(_ sender: UIButton) {
        setRateOptionsSelection(true)
    }
    
    @IBAction func lowRateWasTapped(_ sender: UIButton) {
        setRateOptionsSelection(false)
    }
}

extension FilterViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.numberOfRows ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(indexPath: indexPath) as CitiesCell
        presenter?.configure(cell: cell, forRow: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.didSelect(row: indexPath.row)
    }
}

extension FilterViewController: FilterView {
    func reloadData() {
        self.citiesCollectionView.reloadData()
    }
}