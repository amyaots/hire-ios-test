//
//  StationsStationsAssembly.swift
//  hire-ios-test
//
//  Created by Aleksandr Myaots on 28/08/2016.
//  Copyright © 2016 myaots. All rights reserved.
//

import UIKit
import Swinject

class StationsModuleAssembly: ViperModuleAssembly {
    required init() {}

    func assemble(container: Container) {
        // View
        container.registerForStoryboard(StationsViewController.self) { (r, c) in
            c.output = r.resolve(StationsModuleInput.self, argument: c) as! StationsViewOutput
        }
        
        // Presenter
        container.register(StationsModuleInput.self) { (r, c: StationsViewController) in
            let presenter =  StationsPresenter()
            presenter.view = c
            return presenter
        }.initCompleted { (r, p) in
            let p = p as! StationsPresenter
            
            p.router = r.resolve(StationsRouterInput.self, argument: p.view as! TransitionHandler)
        }
        
        // Router
        container.register(StationsRouterInput.self) { (r, v: TransitionHandler) in
            let router = StationsRouter()
            router.transitionHandler = v
            return router
        }
    }
}

