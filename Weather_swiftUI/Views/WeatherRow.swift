//
//  WeatherRow.swift
//  Weather_swiftUI
//
//  Created by Shraddha on 21/11/22.
//

import SwiftUI

struct WeatherRow: View {
    var weather: WeatherData
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    
                    Text(weather.name)
                        .bold()
                        .font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                    Spacer(minLength: 10)
                    
                    HStack {
                        HStack(spacing: 20) {
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Min temp")
                                    .font(.caption)
                                
                                Text("\(weather.main.temp_min)" + ("°"))
                                    .bold()
                                    .font(.title)
                            }
                        }
                        
                        HStack(spacing: 20) {
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Max temp")
                                    .font(.caption)
                                
                                Text("\(weather.main.temp_max)" + ("°"))
                                    .bold()
                                    .font(.title)
                            }
                        }
                    }
                    
                    HStack {
                        Text(weather.weather.first?.description ?? "")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                .background(.white)
                .cornerRadius(20)
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            Spacer().frame(height: 20)
        }
        .edgesIgnoringSafeArea(.bottom)
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRow(weather: WeatherData(weather: [WeatherData.WeatherDetails(id: 1, main: "", description: "")], main: WeatherData.MainResponse(temp: 0, temp_min: 0, temp_max: 0), name: ""))
    }
}

