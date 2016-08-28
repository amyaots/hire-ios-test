//
//  StationsStationsModuleInput.swift
//  hire-ios-test
//
//  Created by Aleksandr Myaots on 28/08/2016.
//  Copyright © 2016 myaots. All rights reserved.
//

protocol StationsModuleInput: class, ModuleInput {
    func setCitiesWithFlag(cities: [City], isFrom: Bool, output: StationsModuleOutput)
}
