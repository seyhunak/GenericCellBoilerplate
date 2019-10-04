//
//  TableViewController.swift
//  GenericCellBoilerplate
//
//  Created by Seyhun Akyürek on 03/09/2019.
//  Copyright © 2019 Seyhun Akyürek. All rights reserved.
//

import UIKit

final class TableViewController: UITableViewController {
    internal var viewModel = TableViewModel()
    private var dataSource: TableViewDataSource?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewController()
        self.setupViewModel()
    }
}

extension TableViewController {
    private func setupViewController() {
        self.navigationItem.title = List.Title
        self.tableView.delegate = self
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.tableFooterView = UIView()
        self.tableView.register(cellType: GenericCell.self)
    }
    
    private func setupViewModel() {
        self.viewModel.changeHandler = { [unowned self] change in
            self.applyChange(change)
        }
    }
}

private extension TableViewController {
    func applyChange(_ change: TableViewModel.Change) {
        switch change {
        case .data(let data):
            self.dataSource = TableViewDataSource(cellData: data)
            self.tableView.dataSource = self.dataSource
            self.tableView.reloadData()
        case .alert(let message):
            guard let message = message else {
                return
            }
            presentWarningAlert(message: message)
        }
    }
}

extension TableViewController {
    override func tableView(_ tableView: UITableView,
                            heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellData = self.dataSource?.cellData[indexPath.row]
        presentWarningAlert(message: "\(indexPath) - \(String(describing: cellData?.title))")
    }
}
