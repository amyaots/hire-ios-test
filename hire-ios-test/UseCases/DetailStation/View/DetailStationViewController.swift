//
//  DetailStationDetailStationViewController.swift
//  hire-ios-test
//
//  Created by Aleksandr Myaots on 28/08/2016.
//  Copyright © 2016 myaots. All rights reserved.
//

import UIKit

class DetailStationViewController: BaseViewController {
	
	//MARK: - Properties

    weak var assembler = ViperAssembler<DetailStationModuleAssembly>()

    var output: DetailStationViewOutput!

    @IBOutlet private weak var countryLabel: UILabel!
    @IBOutlet private weak var regionLabel: UILabel!
    @IBOutlet private weak var districtLabel: UILabel!
    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet private weak var stationLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
}

// MARK: - View Input
extension DetailStationViewController: DetailStationViewInput {
    func setupInitialState() {
    
    }
    
    func setLabels(station: Station) {
        stationLabel.text = station.stationTitle
        countryLabel.text = station.countryTitle
        regionLabel.text = station.regionTitle
        districtLabel.text = station.districtTitle
        cityLabel.text = station.cityTitle
    }
}

//MARK: - ModuleInputeProvider

extension DetailStationViewController: ModuleInputProvider {
    var moduleInput: ModuleInput! {
        return output as? ModuleInput
    }
}
