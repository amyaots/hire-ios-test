//
//  DetailStationDetailStationPresenter.swift
//  hire-ios-test
//
//  Created by Aleksandr Myaots on 28/08/2016.
//  Copyright © 2016 myaots. All rights reserved.
//

class DetailStationPresenter {
    weak var view: DetailStationViewInput!
    var station: Station!
}

// MARK: - Module Input
extension DetailStationPresenter: DetailStationModuleInput {
    func setStation(station: Station) {
        self.station = station
    }
}

// MARK: - View Output
extension DetailStationPresenter: DetailStationViewOutput {
    func viewIsReady() {
        view.setLabels(self.station)
    }
}