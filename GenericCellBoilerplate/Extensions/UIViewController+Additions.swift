//
//  UIViewController+Additions.swift
//  GenericCellBoilerplate
//
//  Created by Seyhun Akyürek on 03/09/2019.
//  Copyright © 2019 Seyhun Akyürek. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func presentWarningAlert(message: String) {
        let alertController = UIAlertController(title: "Warning",
                                                message: message,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK",
                                                style: .default,
                                                handler:nil))
        present(alertController,
                animated: true,
                completion: nil)

    }
}
