//
//  Data.swift
//  PrototypeUIApp
//
//  Created by Arkadijs Makarenko on 05/07/2017.
//  Copyright © 2017 ArchieApps. All rights reserved.
//

import UIKit

class Data {
    
    static func getData(completion: @escaping ([Model]) -> ()) {
    
    var data = [Model]()
        data.append(Model(title:"Title", subTitle: "Subtitle", image: nil, data1: "Data1", data2: "Data2"))
        
        DispatchQueue.main.async {
            completion(data)
        }
    }
}
