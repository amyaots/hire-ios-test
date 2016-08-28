//
//  DetailStationDetailStationAssembly.swift
//  hire-ios-test
//
//  Created by Aleksandr Myaots on 28/08/2016.
//  Copyright © 2016 myaots. All rights reserved.
//

import UIKit
import Swinject

class DetailStationModuleAssembly: ViperModuleAssembly {
    required init() {}

    func assemble(container: Container) {
        // View
        container.registerForStoryboard(DetailStationViewController.self) { (r, c) in
            c.output = r.resolve(DetailStationModuleInput.self, argument: c) as! DetailStationViewOutput
        }
        
        // Presenter
        container.register(DetailStationModuleInput.self) { (r, c: DetailStationViewController) in
            let presenter =  DetailStationPresenter()
            presenter.view = c
            return presenter
        }.initCompleted { (r, p) in
            let p = p as! DetailStationPresenter
            
            p.router = r.resolve(DetailStationRouterInput.self, argument: p.view as! TransitionHandler)
            p.interactor = r.resolve(DetailStationInteractorInput.self, argument: p as DetailStationInteractorOutput)
        }
        
        // Router
        container.register(DetailStationRouterInput.self) { (r, v: TransitionHandler) in
            let router = DetailStationRouter()
            router.transitionHandler = v
            return router
        }

        // Interactor
        container.register(DetailStationInteractorInput.self) { (r, p: DetailStationInteractorOutput) in
            let interactor =  DetailStationInteractor()
            interactor.output = p
            return interactor
        }
    }
}

