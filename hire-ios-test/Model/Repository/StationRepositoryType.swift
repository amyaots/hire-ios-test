//
//  StationRepositoryType.swift
//  hire-ios-test
//
//  Created by Aleksandr Myaots on 28.08.16.
//  Copyright © 2016 amyaots. All rights reserved.
//

import PromiseKit

protocol StationRepositoryType {
    func getStations() -> Promise<ArraysCities>
}
