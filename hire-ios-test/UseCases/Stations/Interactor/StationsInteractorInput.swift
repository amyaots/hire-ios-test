//
//  StationsStationsInteractorInput.swift
//  hire-ios-test
//
//  Created by Aleksandr Myaots on 28/08/2016.
//  Copyright © 2016 myaots. All rights reserved.
//

import Foundation

protocol StationsInteractorInput {
    func filterCity(searchText: String, cities: [City]) -> [City]
}
