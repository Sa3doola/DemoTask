//
//  OrderDetailsViewController.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/18/21.
//

import UIKit

final class OrderDetailsViewController: UIViewController {
    
    var configurator: OrderDetailsConfiguratorImplementation!
    
    var presenter: OrderDetailsPresenter?
    
    @IBOutlet weak var orderTableView: UITableView!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    // MARK: - UIViewController Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(OrderDetailsViewController: self)
        presenter?.viewDidLoad()
        configureTable()
    }
    
    private func configureTable() {
        orderTableView.register(UINib(nibName: "OrderDetailsCell", bundle: nil),
                                forCellReuseIdentifier: "OrderDetailsCell")
    }
    
    @IBAction func completeOrderWasTapped(_ sender: UIButton) {
        
    }
}

extension OrderDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OrderDetailsCell",
                                                       for: indexPath) as? OrderDetailsCell else { return UITableViewCell() }
        presenter?.configure(cell: cell, forRow: indexPath.row)
        return cell
    }
}

extension OrderDetailsViewController: OrderDetailsView {
    func reloadData(price: Double) {
        self.totalPriceLabel.text = "\(price)SR"
        self.orderTableView.reloadData()
    }
}
