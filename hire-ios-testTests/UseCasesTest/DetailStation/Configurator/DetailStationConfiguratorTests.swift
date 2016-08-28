//
//  DetailStationDetailStationConfiguratorTests.swift
//  hire-ios-test
//
//  Created by Aleksandr Myaots on 28/08/2016.
//  Copyright © 2016 myaots. All rights reserved.
//

import XCTest

class DetailStationModuleConfiguratorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConfigureModuleForViewController() {

        //given
        let viewController = DetailStationViewControllerMock()
        let configurator = DetailStationModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewController)

        //then
        XCTAssertNotNil(viewController.output, "DetailStationViewController is nil after configuration")
        XCTAssertTrue(viewController.output is DetailStationPresenter, "output is not DetailStationPresenter")

        let presenter: DetailStationPresenter = viewController.output as! DetailStationPresenter
        XCTAssertNotNil(presenter.view, "view in DetailStationPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in DetailStationPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is DetailStationRouter, "router is not DetailStationRouter")

        let interactor: DetailStationInteractor = presenter.interactor as! DetailStationInteractor
        XCTAssertNotNil(interactor.output, "output in DetailStationInteractor is nil after configuration")
    }

    class DetailStationViewControllerMock: DetailStationViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
