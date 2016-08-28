//
//  ScheduleScheduleRouterInput.swift
//  hire-ios-test
//
//  Created by Aleksandr Myaots on 27/08/2016.
//  Copyright © 2016 myaots. All rights reserved.
//

protocol ScheduleRouterInput {
    func openStations(cities: [City], isFrom: Bool, withOutput output: StationsModuleOutput)
}
