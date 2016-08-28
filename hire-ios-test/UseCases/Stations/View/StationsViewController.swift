//
//  StationsStationsViewController.swift
//  hire-ios-test
//
//  Created by Aleksandr Myaots on 28/08/2016.
//  Copyright © 2016 myaots. All rights reserved.
//

import UIKit

class StationsViewController: BaseViewController {
    
    //MARK: - Properties
    
    weak var assembler = ViperAssembler<StationsModuleAssembly>()

    var output: StationsViewOutput!
    
    var displayManager: StationsDisplayManager!

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayManager = StationsDisplayManager(output: output, tableView: tableView)
        
        output.viewIsReady()
    }
    
    @IBAction func selectStation(sender: UIBarButtonItem) {
        guard let station = displayManager.selectedStation else {return}
        output.selectStation(station)
    }
    
}

// MARK: - View Input
extension StationsViewController: StationsViewInput {
    func setupInitialState() {
    
    }
    
    func displayCities(cities: [City]) {
        displayManager.cities = cities
    }
}

//MARK: - ModuleInputeProvider

extension StationsViewController: ModuleInputProvider {
    var moduleInput: ModuleInput! {
        return output as? ModuleInput
    }
}

extension StationsViewController: UISearchBarDelegate {
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        output.search(searchText)
    }
}