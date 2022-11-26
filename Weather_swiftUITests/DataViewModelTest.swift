//
//  DataViewModelTest.swift
//  Weather_swiftUITests
//
//  Created by Shraddha on 25/11/22.
//

import XCTest

class DataViewModelTests: XCTestCase {
    
    var viewModel: DataViewModel?
    let service = MockApiService()

    override func setUp() {
        viewModel = DataViewModel(service: service)
    }
    
    override func tearDown() {
        viewModel = nil
    }

    func testWeatherData_isNil() {
        XCTAssertNil(viewModel?.weatherData)
    }
    
    func testWeatherDataHasValue() {
        let data = WeatherResponse(list: [WeatherData(weather: [WeatherData.WeatherDetails(id: 1, main: "main", description: "descrr")], main: WeatherData.MainResponse(temp: 10, temp_min: 10, temp_max: 20), name: "name")])
        viewModel = DataViewModel(service: service)
        viewModel?.weatherData = data
        XCTAssertNotNil(viewModel?.weatherData)
    }

    func testModelServiceInit() {
        viewModel = DataViewModel(service: service)
        XCTAssertNotNil(viewModel?.service)
    }
}

class WeatherResponseTests: XCTestCase {
    private var weatherData: WeatherResponse!
    
    override func setUp() {
        weatherData = WeatherResponse(list: [])
    }
    
    override func tearDown() {
        weatherData = nil
    }
    
    func testListIsEmpty() {
        XCTAssertTrue(weatherData.list.count == 0)
    }
    
    func testListIsNotEmpty() {
        XCTAssertTrue(weatherData.list.count > 0)
    }
}

