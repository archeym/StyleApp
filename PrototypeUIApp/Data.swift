//
//  Data.swift
//  PrototypeUIApp
//
//  Created by Arkadijs Makarenko on 05/07/2017.
//  Copyright © 2017 ArchieApps. All rights reserved.
//  Getting data from a different source

import UIKit

class Data {
    
    static func getData(completion: @escaping ([Model]) -> ()) {
        DispatchQueue.global(qos: .userInteractive).async {
            
        
    var data = [Model]()
            data.append(Model(title:"First Date", subTitle: "with Sasha", images: [], data1: "10", data2: "AM"))
            data.append(Model(title:"Lunch", subTitle: "with Sasha", images: [], data1: "1", data2: "PM"))
            data.append(Model(title:"Second Date", subTitle: "with Sasha", images: getImages(), data1: "5", data2: "PM"))
            data.append(Model(title:"Dinner", subTitle: "with Sasha", images: [], data1: "7", data2: "PM"))

        DispatchQueue.main.async {
            completion(data)
            }
        }
    }
    static func getImages() -> [UIImage]{
        var images = [UIImage]()
        images.append(#imageLiteral(resourceName: "sasha1"))
        images.append(#imageLiteral(resourceName: "sasha2"))
        images.append(#imageLiteral(resourceName: "sasha3"))
        
        return images
    }
    
    static func getDayWeather(completion: @escaping (DayWeather?) -> ()) {
        DispatchQueue.global(qos: .userInteractive).async {
            
            let data = DayWeather(dayName: "Friday", longDate: "14 July 2017", weatherIcon: #imageLiteral(resourceName: "claudy"), temperature: "18º", city: "Dublin")
            
            DispatchQueue.main.async {
                completion(data)
            }
        }
    }
}
