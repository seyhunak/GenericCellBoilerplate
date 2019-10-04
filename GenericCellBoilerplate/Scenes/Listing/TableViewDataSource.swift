//
//  TableViewDataSource.swift
//  GenericCellBoilerplate
//
//  Created by Seyhun Akyürek on 04/10/2019.
//  Copyright © 2019 Seyhun Akyürek. All rights reserved.
//

import UIKit

class TableViewDataSource: NSObject, UITableViewDataSource {
    var cellData: [CellData?]

    init(cellData: [CellData?]) {
        self.cellData = cellData
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return cellData.count
    }

    func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = cellData[indexPath.row] else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(with: GenericCell.self, for: indexPath)
        cell.setViewModel(data)
        return cell
    }

}
