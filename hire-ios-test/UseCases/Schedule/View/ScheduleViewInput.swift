//
//  ScheduleScheduleViewInput.swift
//  hire-ios-test
//
//  Created by Aleksandr Myaots on 27/08/2016.
//  Copyright © 2016 myaots. All rights reserved.
//

protocol ScheduleViewInput: class , ViewInput{

    /**
        @author Aleksandr Myaots
        Setup initial state of the view
    */

    func setupInitialState()
    
    func setStationFrom(stationTitle: String)
    func setStationTo(stationTitle: String)
}
