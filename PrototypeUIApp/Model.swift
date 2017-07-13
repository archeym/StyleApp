//
//  Model.swift
//  PrototypeUIApp
//
//  Created by Arkadijs Makarenko on 05/07/2017.
//  Copyright © 2017 ArchieApps. All rights reserved.
//

import UIKit

class Model {
    
    var title = ""
    var subTitle = ""
    var image : UIImage?
    var data1 = ""
    var data2 = ""
    
    init(title:String, subTitle: String, image: UIImage?, data1 : String, data2 : String ) {
        self.title = title
        self.subTitle = subTitle
        self.image = image
        self.data1 = data1
        self.data2 = data2
    }
}
