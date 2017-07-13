//
//  TableViewCell.swift
//  PrototypeUIApp
//
//  Created by Arkadijs Makarenko on 05/07/2017.
//  Copyright © 2017 ArchieApps. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var data1Label: UILabel!
    @IBOutlet weak var data2Label: UILabel!
    
    func setup(model: Model) {
        titleLabel.text = model.title
        subtitleLabel.text = model.subTitle
        cellImageView.image = model.image
        data1Label.text = model.data1
        data2Label.text = model.data2
    }

}