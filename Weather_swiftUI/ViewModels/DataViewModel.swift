//
//  DataViewModel.swift
//  Weather_swiftUI
//
//  Created by Shraddha on 22/11/22.
//

import Foundation
import Combine

class DataViewModel: ObservableObject {
    
    var weatherData: WeatherResponse? {
        didSet { self.objectWillChange.send() }
    }
    
    let service: Service
    var cancellables = Set<AnyCancellable>()
    
    init(service: Service) {
        self.service = service
    }
    
    func fetchWheatherDataApi(lat: Double, long: Double) {
        service.getWeatherData(lat: lat, long: long)
            .sink { data in
                switch data {
                case .finished:
                    print("Fetched the data Sucessfully")
                case .failure(let error) :
                    print("Got Error", error.localizedDescription)
                }
            } receiveValue: { [weak self] weatherData in
                self?.weatherData = weatherData
            }.store(in: &cancellables)
    }
}
