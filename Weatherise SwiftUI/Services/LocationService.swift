//
//  LocationService.swift
//  Weatherise SwiftUI
//
//  Created by Dimas Putro on 07/06/22.
//

import CoreLocation

class LocationService: NSObject, CLLocationManagerDelegate, ObservableObject {

  private var locationManager: CLLocationManager?
  private var currentCoordinate: CLLocationCoordinate2D?
  @Published var coodinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 37.331676, longitude: -122.030189)

  override init() {
    super.init()

    locationManager = CLLocationManager()
    requestPermission() 
    locationManager?.delegate = self
    locationManager?.desiredAccuracy = kCLLocationAccuracyBest
  }

  func requestPermission() {
    locationManager?.requestWhenInUseAuthorization()
    locationManager?.startUpdatingLocation()
  }

  func getCurrentLocation() -> CLLocationCoordinate2D {
    return currentCoordinate ?? CLLocationCoordinate2D(latitude: 37.331676, longitude: -122.030189)
  }

  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let location = locations.first else {
      return
    }

    currentCoordinate = location.coordinate
    coodinate = location.coordinate
  }
}
