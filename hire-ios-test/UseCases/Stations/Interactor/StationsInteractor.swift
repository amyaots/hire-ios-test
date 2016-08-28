//
//  StationsStationsInteractor.swift
//  hire-ios-test
//
//  Created by Aleksandr Myaots on 28/08/2016.
//  Copyright © 2016 myaots. All rights reserved.
//

class StationsInteractor: StationsInteractorInput {
    
    func filterCity(searchText: String, cities: [City]) -> [City] {
        var filteredCities = [City]()
        
        for city in cities {
            let filteredStations = city.stations.filter({ station -> Bool in
                return station.stationTitle.rangeOfString(searchText, options: .CaseInsensitiveSearch) != nil
            })
            if filteredStations.count > 0 {
                let filteredCity = city
                filteredCity.stations = filteredStations
                filteredCities.append(filteredCity)
            }
        }
        
        return filteredCities
    }
}
