//
//  StationService.swift
//  hire-ios-test
//
//  Created by Aleksandr Myaots on 28.08.16.
//  Copyright © 2016 amyaots. All rights reserved.
//

import PromiseKit

class StationService: StationServiceType {
    
    let stationRepository: StationRepositoryType
    
    init(stationRepository: StationRepositoryType) {
        self.stationRepository = stationRepository
    }
    
    func getStations() -> Promise<ArraysCities> {
        return stationRepository.getStations()
    }
}
