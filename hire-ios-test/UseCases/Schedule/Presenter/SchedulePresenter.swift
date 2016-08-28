//
//  ScheduleSchedulePresenter.swift
//  hire-ios-test
//
//  Created by Aleksandr Myaots on 27/08/2016.
//  Copyright © 2016 myaots. All rights reserved.
//

import Foundation

class SchedulePresenter {
    weak var view: ScheduleViewInput!
    var interactor: ScheduleInteractorInput!
    var router: ScheduleRouterInput!
}

// MARK: - Module Input
extension SchedulePresenter: ScheduleModuleInput {
	
}

// MARK: - View Output
extension SchedulePresenter: ScheduleViewOutput {
    func viewIsReady() {
        view.setupInitialState()
    }
    
    func editDate(date: NSDate) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        dateFormatter.locale = NSLocale(localeIdentifier: "ru-RU")
        return dateFormatter.stringFromDate(date)
    }
    
    func selectStation(isFrom: Bool) {
        interactor.selectStations(isFrom: isFrom)
    }
}

// MARK: - Interactor Output
extension SchedulePresenter: ScheduleInteractorOutput {
    func gotStations(cities: [City], isFrom: Bool) {
        router.openStations(cities, isFrom: isFrom, withOutput: self)
    }
    
    func encounteredError(error: ErrorType) {
        let error = error as NSError
        view.showError(error.domain)
    }
}

extension SchedulePresenter: StationsModuleOutput {
    func selectedStation(station: Station, isFrom: Bool) {
        if isFrom {
            view.setStationFrom(station.stationTitle)
        } else {
            view.setStationTo(station.stationTitle)
        }
    }
}