//
//  StationsStationsRouter.swift
//  hire-ios-test
//
//  Created by Aleksandr Myaots on 28/08/2016.
//  Copyright © 2016 myaots. All rights reserved.
//

class StationsRouter: StationsRouterInput {
	weak var transitionHandler: TransitionHandler!
    
    func openDetailStation(station: Station) {
        transitionHandler?.openModule("detailStation") { module in
            guard let detailStationModule = module as? DetailStationModuleInput else {
                fatalError()
            }
            detailStationModule.setStation(station)
        }
    }
    
    func closeCurrentModule() {
        transitionHandler.closeCurrentModule()
    }
}
