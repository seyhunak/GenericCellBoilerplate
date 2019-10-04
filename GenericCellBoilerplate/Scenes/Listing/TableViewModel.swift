//
//  TableViewModel.swift
//  GenericCellBoilerplate
//
//  Created by Seyhun Akyürek on 03/09/2019.
//  Copyright © 2019 Seyhun Akyürek. All rights reserved.
//

import Foundation
import Alamofire

struct TableViewModel {
    enum Change {
        case data(data: [CellData?])
        case alert(message: String?)
    }
    
    var changeHandler: ((Change) -> Void)? {
       didSet {
           handleChanges()
       }
    }
    
    private func handleChanges() {
        TableClient.fetch { (result) in
            switch result {
            case .success(let table):
                guard let dataTable = table.data else { return }
                let cellData = dataTable.map { (cellDataEnvlope) in return cellDataEnvlope.data }
                self.changeHandler?(.data(data: cellData))
            case .failure(let error):
                self.changeHandler?(.alert(message: error.localizedDescription))
            }
        }
    }
}
