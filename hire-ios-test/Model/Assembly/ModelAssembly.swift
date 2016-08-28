//
//  ModelAssembly.swift
//  hire-ios-test
//
//  Created by Aleksandr Myaots on 28.08.16.
//  Copyright © 2016 amyaots. All rights reserved.
//

import Swinject

class ModelAssembly: AssemblyType {
    func assemble(container: Container) {
        container.register(StationServiceType.self) { (r) in
            let u = r.resolve(StationRepositoryType.self)!
            return StationService(stationRepository: u)
            }.inObjectScope(.Hierarchy)
        
        container.register(StationRepositoryType.self) { (r) in
            return StationRepository()
            }.inObjectScope(.Hierarchy)
    }
}
