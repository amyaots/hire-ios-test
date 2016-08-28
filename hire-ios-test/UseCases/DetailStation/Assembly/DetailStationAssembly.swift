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
        }
    }
}

