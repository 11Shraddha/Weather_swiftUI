//
//  Weather_swiftUIUITests.swift
//  Weather_swiftUIUITests
//
//  Created by Shraddha on 25/11/22.
//

import XCTest

final class Weather_swiftUIUITests: XCTestCase {
    
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
        let app = XCUIApplication()
        app.launch()
        
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}


class WeatherRowUITests: XCTestCase {
    private var rowUI: XCUIApplication!
    var weatherRow: WeatherRow?
    
    override func setUp() {
        continueAfterFailure = false
        weatherRow = WeatherRow(weather: WeatherData(weather: [WeatherData.WeatherDetails(id: 1, main: "", description: "")], main: WeatherData.MainResponse(temp: 0, temp_min: 0, temp_max: 0), name: "London"))
        rowUI = XCUIApplication()
        rowUI.launch()
    }
    
    override func tearDown() {
        rowUI = nil
    }
    
    func testRowIsVisible() {
//        XCTAssertEqual(rowUI.tableRows, weatherRow)
    }
    
    
    func testTitleIsVisible() {
        let nameStr = rowUI.staticTexts["London"]
        XCTAssert(nameStr.exists)
    }
}
