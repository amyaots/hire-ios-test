//
//  ArraysCities.swift
//  hire-ios-test
//
//  Created by Aleksandr Myaots on 28.08.16.
//  Copyright © 2016 amyaots. All rights reserved.
//

import Foundation
import ObjectMapper

class ArraysCities: Mappable {
    
    //MARK: - Properties
    
    var citiesFrom = [City]()
    var citiesTo = [City]()
    
    //MARK: - Init
    
    convenience required init?(_ map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        self.citiesFrom <- map["citiesFrom"]
        self.citiesTo   <- map["citiesTo"]
    }    
}
