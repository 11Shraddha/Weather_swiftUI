//
//  WeatherModel.swift
//  Weather_swiftUI
//
//  Created by Shraddha on 22/11/22.
//

import Foundation

struct WeatherResponse: Decodable {
    var list: [WeatherData]
}

// Model of the response body we get from calling the OpenWeather API
struct WeatherData: Decodable {
    var weather: [WeatherDetails]
    var main: MainResponse
    var name: String
    
    struct CoordinatesResponse: Decodable {
        var lon: Double
        var lat: Double
    }
    
    struct WeatherDetails: Decodable {
        var id: Double
        var main: String
        var description: String
    }
    
    struct MainResponse: Decodable {
        var temp: Double
        var temp_min: Double
        var temp_max: Double
    }
}


