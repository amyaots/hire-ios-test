//
//  CoordinatePoint.swift
//  hire-ios-test
//
//  Created by Aleksandr Myaots on 28.08.16.
//  Copyright © 2016 amyaots. All rights reserved.
//

import ObjectMapper

class CoordinatePoint : Mappable {
    var longitude: Double = 0.0
    var latitude: Double = 0.0
    
    convenience required init?(_ map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        self.longitude <- map["longitude"]
        self.latitude <- map["latitude"]
    }
}
