//
//  StationsStationsViewOutput.swift
//  hire-ios-test
//
//  Created by Aleksandr Myaots on 28/08/2016.
//  Copyright © 2016 myaots. All rights reserved.
//

protocol StationsViewOutput {

    /**
        @author Aleksandr Myaots
        Notify presenter that view is ready
    */

    func viewIsReady()
    
    func detailStation(station: Station)
    func selectStation(station: Station)
    func search(searchText: String)
}
