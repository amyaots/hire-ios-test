//
//  ScheduleScheduleAssembly.swift
//  hire-ios-test
//
//  Created by Aleksandr Myaots on 27/08/2016.
//  Copyright © 2016 myaots. All rights reserved.
//

import UIKit
import Swinject

class ScheduleModuleAssembly: ViperModuleAssembly {
    required init() {}

    func assemble(container: Container) {
        // View
        container.registerForStoryboard(ScheduleViewController.self) { (r, c) in
            c.output = r.resolve(ScheduleModuleInput.self, argument: c) as! ScheduleViewOutput
        }
        
        // Presenter
        container.register(ScheduleModuleInput.self) { (r, c: ScheduleViewController) in
            let presenter =  SchedulePresenter()
            presenter.view = c
            return presenter
        }.initCompleted { (r, p) in
            let p = p as! SchedulePresenter
            
            p.router = r.resolve(ScheduleRouterInput.self, argument: p.view as! TransitionHandler)
            p.interactor = r.resolve(ScheduleInteractorInput.self, argument: p as ScheduleInteractorOutput)
        }
        
        // Router
        container.register(ScheduleRouterInput.self) { (r, v: TransitionHandler) in
            let router = ScheduleRouter()
            router.transitionHandler = v
            return router
        }

        // Interactor
        container.register(ScheduleInteractorInput.self) { (r, p: ScheduleInteractorOutput) in
            let interactor =  ScheduleInteractor()
            interactor.output = p
            interactor.stationService = r.resolve(StationServiceType.self)
            return interactor
        }
    }
}

