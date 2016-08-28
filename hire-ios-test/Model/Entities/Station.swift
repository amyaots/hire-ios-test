//
//  Station.swift
//  hire-ios-test
//
//  Created by Aleksandr Myaots on 28.08.16.
//  Copyright © 2016 amyaots. All rights reserved.
//

import ObjectMapper

class Station: Mappable {
    
    //MARK: - Properties
    
    var countryTitle = ""
    var point = CoordinatePoint()
    var districtTitle = ""
    var cityId = ""
    var cityTitle = ""
    var regionTitle = ""
    var stationId = 0
    var stationTitle = ""
    
    //MARK: - Init
    
    convenience required init?(_ map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        self.countryTitle   <- map["countryTitle"]
        self.point          <- map["point"]
        self.districtTitle  <- map["districtTitle"]
        self.cityId         <- map["cityId"]
        self.cityTitle      <- map["cityTitle"]
        self.regionTitle    <- map["regionTitle"]
        self.stationId      <- map["stationId"]
        self.stationTitle   <- map["stationTitle"]
    }
}