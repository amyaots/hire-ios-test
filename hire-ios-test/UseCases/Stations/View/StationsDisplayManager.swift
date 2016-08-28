//
//  StationsDisplayManager.swift
//  hire-ios-test
//
//  Created by Aleksandr Myaots on 28.08.16.
//  Copyright © 2016 amyaots. All rights reserved.
//

import UIKit

class StationsDisplayManager: NSObject {
    
    //MARK: - Properties
    
    weak var tableView: UITableView?
    
    var output: StationsViewOutput
    
    var cities: [City] = [] {
        didSet {
            tableView?.reloadData()
        }
    }
    
    var selectedStation: Station?
    
    //MARK: - Init
    
    init(output: StationsViewOutput, tableView: UITableView) {
        self.tableView = tableView
        self.output = output
        super.init()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension StationsDisplayManager: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return cities.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities[section].stations.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("stationCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = cities[indexPath.section].stations[indexPath.row].stationTitle
        
        return cell
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeader = tableView.dequeueReusableCellWithIdentifier("cityHeader")
        sectionHeader?.textLabel?.text = cities[section].countryTitle + ", " + cities[section].cityTitle
        return sectionHeader
    }
}

extension StationsDisplayManager: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedStation = cities[indexPath.section].stations[indexPath.row]
    }
    
    func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        output.detailStation(cities[indexPath.section].stations[indexPath.row])
    }
}
