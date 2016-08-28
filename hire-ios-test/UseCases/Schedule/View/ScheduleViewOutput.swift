//
//  ScheduleScheduleViewOutput.swift
//  hire-ios-test
//
//  Created by Aleksandr Myaots on 27/08/2016.
//  Copyright © 2016 myaots. All rights reserved.
//

import Foundation

protocol ScheduleViewOutput {

    /**
        @author Aleksandr Myaots
        Notify presenter that view is ready
    */

    func viewIsReady()
    
    func editDate(date: NSDate) -> String
    func selectStation(isFrom: Bool)
}
