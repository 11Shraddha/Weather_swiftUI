//
//  ApiService.swift
//  Weather_swiftUI
//
//  Created by Shraddha on 22/11/22.
//

import Foundation
import Combine

protocol Service {
    func getWeatherData(lat: Double, long: Double) -> AnyPublisher<WeatherResponse, Error>
}

class APIService: Service {
    
    func getWeatherData(lat: Double, long: Double) -> AnyPublisher<WeatherResponse, Error> {
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/find?lat=\(lat)&lon=\(long)&cnt=15&appid=7cc18da06eb4fe5abeeb581107b03f33&units=metric") else { fatalError("Missing URL") }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map({
                return $0.data
            })
            .decode(type: WeatherResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}


class MockApiService: Service {
    let testData: WeatherResponse = .init(list: [WeatherData(weather: [WeatherData.WeatherDetails(id: 1, main: "", description: "")], main: WeatherData.MainResponse(temp: 0, temp_min: 0, temp_max: 0), name: "")])
    
    func getWeatherData(lat: Double, long: Double) -> AnyPublisher<WeatherResponse, Error> {
        Just(testData)
            .tryMap({ $0 })
            .eraseToAnyPublisher()
    }
}

