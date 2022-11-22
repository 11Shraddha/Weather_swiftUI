//
//  ContentView.swift
//  Weather_swiftUI
//
//  Created by Shraddha on 21/11/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    @StateObject var dataVM: DataViewModel
    
    init() {
        _dataVM = StateObject(wrappedValue: DataViewModel(service: APIService()))
        if let lat = locationManager.lat, let long = locationManager.long {
            dataVM.fetchWheatherDataApi(lat: lat, long: long)
        }
    }
    
    var body: some View {
        VStack {
            if locationManager.lat != nil {
                if let data = dataVM.weatherData {
                    List(data.list, id: \.name) { weather in
                        WeatherRow(weather: weather)
                            .listRowInsets(EdgeInsets())
                    }
                } else {
                    ActivityIndicatorView()
                }
            } else {
                ActivityIndicatorView()
            }
        }.onChange(of: locationManager.lat) { newValue in
            if let lat = locationManager.lat, let long = locationManager.long {
                dataVM.fetchWheatherDataApi(lat: lat, long: long)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

