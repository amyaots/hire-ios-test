//
//  StationsStationsViewInput.swift
//  hire-ios-test
//
//  Created by Aleksandr Myaots on 28/08/2016.
//  Copyright © 2016 myaots. All rights reserved.
//

protocol StationsViewInput: class, ViewInput{

    /**
        @author Aleksandr Myaots
        Setup initial state of the view
    */

    func setupInitialState()
    
    func displayCities(cities: [City])
}
