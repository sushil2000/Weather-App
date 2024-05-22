//
//  LocationManager.swift
//  Weather App
//
//  Created by Sushil Sharma on 22/05/2024.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    
    // public variables
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init() {
        super.init()
        manager.delegate = self
    }

    func requestLocation(){
        isLoading = true
        manager.requestLocation()
    }
    
    //locations[CLLocations] is an array
    func locationManager(_ manager: CLLocationManager, didUpdateLocation locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        <#code#>print("Error getting location", error)
        isLoading = false
    }
}
