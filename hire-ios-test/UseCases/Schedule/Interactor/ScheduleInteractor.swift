//
//  ScheduleScheduleInteractor.swift
//  hire-ios-test
//
//  Created by Aleksandr Myaots on 27/08/2016.
//  Copyright © 2016 myaots. All rights reserved.
//

class ScheduleInteractor: ScheduleInteractorInput {

    weak var output: ScheduleInteractorOutput!
    
    var stationService: StationServiceType!
    
    func selectStations(isFrom isFrom: Bool) {
        stationService.getStations().then { arrays -> Void in
            if isFrom {
                self.output.gotStations(arrays.citiesFrom, isFrom: isFrom)
            } else {
                self.output.gotStations(arrays.citiesTo, isFrom: isFrom)
            }
        }.error { error in
             self.output.encounteredError(error)
        }
    }
}
