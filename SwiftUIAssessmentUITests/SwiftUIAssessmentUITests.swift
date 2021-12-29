//
//  SwiftUIAssessmentUITests.swift
//  SwiftUIAssessmentUITests
//
//  Created by Nikhlesh on 29/12/21.
//

import XCTest

class SwiftUIAssessmentUITests: XCTestCase {

    // NOTE: I create UI and Unit test cases for as API response, but we can also create UI and Unit test cases from create stub and Mock data.
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        // Since UI tests are more expensive to run, it's usually
        // a good idea to exit if a failure was encountered
        continueAfterFailure = false
        
        app = XCUIApplication()
        
        // We send the uitesting command line argument to the app to
        // reset its state and to use the alert analytics engine
        app.launchArguments.append("--uitesting")
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // UI tests must launch the application that they test.
        app.activate()
        app.launch()
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func testLogin() {
        
        app.activate()
        app.launch()
        
        if app.buttons["Login"].exists {
            XCTAssertTrue(app.buttons["Login"].exists)
            XCTAssertTrue(app.staticTexts[ConstantsMessages.welcomeText].exists)
        }
    }
    
    func testLogout() {
        app.activate()
        app.launch()
        
        if app.buttons["Login"].exists {
            app.buttons["Login"].tap()
        }
        
        // Since this is an asynchronous network-bound operation, we'll wait for
        sleep(2)
        
        app.tabBars["Tab Bar"].buttons["Account"].tap()
        
        XCTAssertTrue(app.buttons["Logout"].exists)
        
        app.buttons["Logout"].tap()
        
        sleep(2)
        
        XCTAssertTrue(app.staticTexts[ConstantsMessages.welcomeText].exists)
    }
    
    func testReardsInfo() {
        app.activate()
        app.launch()
                
        if app.buttons["Login"].exists {
            app.buttons["Login"].tap()
        }
        
        // Since this is an asynchronous network-bound operation, we'll wait for
        sleep(3)
        
        XCTAssertTrue(app.staticTexts["$139.47"].exists)
        
        let table = app.tables[Identifiers.rewardTable]
        XCTAssertTrue(table.exists)
        XCTAssertGreaterThan(table.cells.count, 0)
        
        let rewardCell = app.tables.firstMatch
        XCTAssertTrue(rewardCell.exists)
        XCTAssertTrue(rewardCell.staticTexts["Disneyland Park"].exists)
        XCTAssertTrue(rewardCell.staticTexts["-$43.82"].exists)
    }
    
    func testRewardDetail() {
        app.activate()
        app.launch()
        
        if app.buttons["Login"].exists {
            app.buttons["Login"].tap()
        }
        
        // Since this is an asynchronous network-bound operation, we'll wait for
        sleep(3)
        
        let table = app.tables[Identifiers.rewardTable]
        XCTAssertTrue(table.cells.staticTexts["Disneyland Park"].firstMatch.exists)
        let rewardCell = table.cells.staticTexts["Disneyland Park"].firstMatch
        rewardCell.tap()
        
        sleep(2)
        
        XCTAssertTrue(app.staticTexts["Disneyland Park"].exists)
        XCTAssertTrue(app.staticTexts["-$43.82"].exists)        
        
        let detailTable = app.tables[Identifiers.rewardDetailTable]
        XCTAssertTrue(detailTable.exists)
        XCTAssertTrue(detailTable.staticTexts["Completed"].exists)
        XCTAssertTrue(detailTable.staticTexts["Jan 13,2021"].exists)
    }
    
    func testAccountInfo() {
        app.activate()
        app.launch()
        
        if app.buttons["Login"].exists {
            app.buttons["Login"].tap()
        }
        
        // Since this is an asynchronous network-bound operation, we'll wait for
        sleep(2)
        
        app.tabBars["Tab Bar"].buttons["Account"].tap()
        
        let detailTable = app.tables[Identifiers.accountTable]
        XCTAssertTrue(detailTable.exists)
        
        XCTAssertTrue(detailTable.staticTexts["0342"].exists)
        XCTAssertTrue(detailTable.staticTexts["001"].exists)
        XCTAssertTrue(detailTable.staticTexts["LL3"].exists)
        XCTAssertTrue(detailTable.staticTexts["6th"].exists)
        XCTAssertTrue(detailTable.staticTexts["House of Waterloo"].exists)
    }
}
