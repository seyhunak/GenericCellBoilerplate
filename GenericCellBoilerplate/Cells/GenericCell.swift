//
//  GenericCell.swift
//  GenericCellBoilerplate
//
//  Created by Seyhun Akyürek on 03/09/2019.
//  Copyright © 2019 Seyhun Akyürek. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class GenericCell: UITableViewCell {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    func setViewModel(_ data: CellData) {
        photoImageView.af_setImage(withURL: URL(string: data.image )!)
        titleLabel.text = data.title
        subtitleLabel.text = data.subTitle
    }
}
