//
//  ScheduleScheduleRouter.swift
//  hire-ios-test
//
//  Created by Aleksandr Myaots on 27/08/2016.
//  Copyright © 2016 myaots. All rights reserved.
//

class ScheduleRouter: ScheduleRouterInput {
	weak var transitionHandler: TransitionHandler!
    
    func openStations(cities: [City], isFrom: Bool, withOutput output: StationsModuleOutput) {
        transitionHandler?.openModule("stations") { module in
            guard let stationsModule = module as? StationsModuleInput else {
                fatalError()
            }
            stationsModule.setCitiesWithFlag(cities, isFrom: isFrom, output: output)
        }
    }
}
