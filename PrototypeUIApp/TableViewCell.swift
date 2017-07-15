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
    @IBOutlet weak var data1Label: UILabel!
    @IBOutlet weak var data2Label: UILabel!
    @IBOutlet weak var profileImageStackView: UIStackView!
    
    func setup(model: Model) {
        titleLabel.text = model.title
        subtitleLabel.text = model.subTitle
        data1Label.text = model.data1
        data2Label.text = model.data2
        
        if model.images.count > 0 {
            for image in model.images {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 36, height: 36))
                imageView.image = image
                profileImageStackView.addArrangedSubview(imageView)
                
            }
        }
    }
}
