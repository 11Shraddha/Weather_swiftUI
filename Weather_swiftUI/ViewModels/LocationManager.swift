//
//  LocationManager.swift
//  Weather_swiftUI
//
//  Created by Shraddha on 21/11/22.
//

import CoreLocation
import SwiftUI

class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    
    @Published var lat: Double? = nil
    @Published var long: Double? = nil
    @Published var isLoading = false
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.requestLocation()
        self.requestAuthorisation()
    }

    func requestAuthorisation(always: Bool = false) {
        if self.locationManager.authorizationStatus == .authorizedWhenInUse {
            self.locationManager.requestLocation()
        } else {
            self.locationManager.requestWhenInUseAuthorization()
        }
    }
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if self.locationManager.authorizationStatus == .authorizedWhenInUse {
            self.locationManager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lat = locations.first?.coordinate.latitude
        long = locations.first?.coordinate.longitude
        isLoading = false
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location", error)
        isLoading = false
    }
}
