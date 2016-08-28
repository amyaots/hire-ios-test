//
//  StationsStationsPresenter.swift
//  hire-ios-test
//
//  Created by Aleksandr Myaots on 28/08/2016.
//  Copyright © 2016 myaots. All rights reserved.
//

class StationsPresenter {
    
    //MARK: - Properties
    
    weak var view: StationsViewInput!
    var interactor: StationsInteractorInput!
    var router: StationsRouterInput!
    var cities = [City]()
    var isFrom = false
    var output: StationsModuleOutput!
}

// MARK: - Module Input
extension StationsPresenter: StationsModuleInput {
    func setCitiesWithFlag(cities: [City], isFrom: Bool, output: StationsModuleOutput) {
        self.cities = cities
        self.isFrom = isFrom
        self.output = output
    }
}

// MARK: - View Output
extension StationsPresenter: StationsViewOutput {
    func viewIsReady() {
        view?.displayCities(self.cities)
    }
    
    func detailStation(station: Station) {
        print(station.stationTitle)
        router.openDetailStation(station)
    }
    
    func selectStation(station: Station) {
        output.selectedStation(station, isFrom: self.isFrom)
        router.closeCurrentModule()
    }
    
    func search(searchText: String) {
        let filteredData = searchText.isEmpty ? self.cities : interactor.filterCity(searchText, cities: self.cities)
        view?.displayCities(filteredData)
    }   
}