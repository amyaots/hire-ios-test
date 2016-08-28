//
//  ScheduleScheduleViewController.swift
//  hire-ios-test
//
//  Created by Aleksandr Myaots on 27/08/2016.
//  Copyright © 2016 myaots. All rights reserved.
//

import UIKit

class ScheduleViewController: BaseViewController {
    
    //MARK: - Properties
    
    weak var assembler = ViperAssembler<ScheduleModuleAssembly>()

    var output: ScheduleViewOutput!

    @IBOutlet private weak var dateTextField: UITextField!
    
    @IBOutlet private weak var stationFromLabel: UILabel!
    @IBOutlet private weak var stationToLabel: UILabel!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    @IBAction func selectStationFrom(sender: UIButton) {
        output.selectStation(true)
    }
    
    @IBAction func selectStationTo(sender: UIButton) {
        output.selectStation(false)
    }
}

// MARK: - View Input
extension ScheduleViewController: ScheduleViewInput {
    func setupInitialState() {
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.Date
        datePickerView.minimumDate = NSDate()
        datePickerView.locale = NSLocale(localeIdentifier: "ru-RU")
        dateTextField.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(ScheduleViewController.datePickerValueChanged), forControlEvents: UIControlEvents.ValueChanged)
        
        let toolBar = UIToolbar(frame: CGRectMake(0, 0, 0, 40))
        toolBar.barStyle = UIBarStyle.Black
        toolBar.tintColor = UIColor.whiteColor()
        let toolBarButton = UIBarButtonItem(title: "Сегодня", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(ScheduleViewController.chooseCurrentDate))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: self, action: nil)
        let shareButton = UIBarButtonItem(title: "Выбрать", style: UIBarButtonItemStyle.Done, target: self, action: #selector(ScheduleViewController.closeDatePicker))
        toolBar.items = [toolBarButton, flexSpace, shareButton]
        dateTextField.inputAccessoryView = toolBar
    }
    
    func setStationFrom(stationTitle: String) {
        stationFromLabel.text = stationTitle
    }
    
    func setStationTo(stationTitle: String) {
        stationToLabel.text = stationTitle
    }
}

extension ScheduleViewController: UITextFieldDelegate {
    
    func datePickerValueChanged(sender:UIDatePicker) {
        dateTextField.text = output.editDate(sender.date)
    }
    
    func chooseCurrentDate() {
        dateTextField.text = output.editDate(NSDate())
        dateTextField.resignFirstResponder()
    }
    
    func closeDatePicker() {
        dateTextField.resignFirstResponder()
    }
}
